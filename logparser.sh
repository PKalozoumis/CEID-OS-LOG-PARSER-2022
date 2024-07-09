#!/bin/bash

function mining_usernames
{
    str=$(awk 'BEGIN{s="\n"}; {temp="\n" $3 "\n"; if (!match(s,temp)) s=s$3 "\n"}; END{print s}' "$1" | sort)

    for user in $str
    do
        awk -v u="$user" 'BEGIN{count=0}; $3 == u {count++}; END{print count " " u}' "$1"
    done
}

function count_browsers
{
    awk 'BEGIN{firefox=0;edge=0;chrome=0;safari=0};
    {
        if (match($0,/.*Mozilla\/.*Firefox\/([0-9]*\.)*[0-9]*/))
            firefox++;
        else if (match($0,/.*Mozilla\/.*Chrome\/.*Safari\/.*Edg\/([0-9]*\.)*[0-9]*/))
            edge++;
        else if (match($0,/.*Mozilla\/.*Chrome\/.*Safari\/([0-9]*\.)*[0-9]*/))
            chrome++;
        else if (match($0,/.*Mozilla\/.*Safari\/([0-9]*\.)*[0-9]*/))
            safari++;
    };
    END{printf "Firefox %s\nChrome %s\nEdge %s\nSafari %s\n", firefox, chrome, edge, safari}' "$1"
}

if [ "$#" -eq 0 ]; then

    echo "Hello World"

else

    case "$1" in

        *.log)

            if [ ! -f "$1" ]; then

                echo "File $1 does not exist"
                exit 1

            fi

        ;;

        *)

            echo "Wrong File Argument"
            exit 1

        ;;

    esac

    case "$#" in

        1) #One argument ===================================================

            sed -n 'p' "$1"
            echo ""

        ;;

        *) #More arguments ===================================================

            case "$2" in

                "--usrid")
                
                    case "$#" in

                        2) mining_usernames "$1" ;;

                        3)  awk -v str="$3" '$3 == str {print $0}' "$1" ;;

                        *) echo "Too Many Arguments";;

                    esac
                ;;    

                "-method")
                
                    case "$#" in

                        2) echo "Wrong Method Name";;

                        3)
                            case "$3" in

                                "GET" | "POST")

                                    sed -n '/.*\"'"$3"' .*/p' "$1"

                                ;;

                                *) echo "Wrong Method Name";;

                             esac
                        ;;

                        *) echo "Too Many Arguments";;

                    esac
                ;;

                "--servprot")
                
                    case "$#" in

                        2) echo "Wrong Network Protocol" ;;

                        3)

                            case "$3" in

                                "IPv4") sed -n '/^\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/p' "$1";;

                                "IPv6") sed -n '/^::1/p' "$1";;

                                *) echo "Wrong Network Protocol";;

                            esac
                        ;;

                        *) echo "Too Many Arguments";;

                    esac
                ;;

                "--browsers")
                
                    case "$#" in

                        2) count_browsers "$1" ;;

                        *) echo "Too Many Arguments";;

                    esac
                ;;

                "--datum")
                
                    case "$#" in

                        2) echo "Wrong Date" ;;

                        3)

                            case "$3" in

                                Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec)
                                
                                    sed -n '/.*\[.*'"$3"'.*/p' "$1"
                                ;;

                                *)
                                    echo "Wrong Date"
                                ;;

                            esac
                        ;;

                        *) echo "Too Many Arguments";;

                    esac
                ;;

                *) echo "Invalid Argument";;
            esac
        ;;
    esac
fi
        