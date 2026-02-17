echo "INSTALLING GO v1.26. You can change version in script."
read -p "Continue? [y/n] " choice

case "$choice" in
    Y|y)
        curl -OL https://go.dev/dl/go1.26.0.linux-amd64.tar.gz
        sudo rm -rf /usr/local/go
        sudo tar -C /usr/local -xzf go1.26.0.linux-amd64.tar.gz

        # Delete tar
        rm go1.26.0.linux-amd64.tar.gz
        echo "run go version to verify"
    ;;
    N|n)
        echo "Install cancelled."
        echo "Edit scipt in ubuntu/7-install-go.sh to install a different Go version."
    ;;
    *) echo default
    ;;
esac

