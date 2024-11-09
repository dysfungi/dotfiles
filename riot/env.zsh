if [[ "$USER" = dfrank ]]; then
    export AWS_PROFILE=product-services
    export VAULT_ADDR=https://vault.security.riotgames.io

    ## LCU Setup ##
    export P4CONFIG=/Users/Shared/p4/depot/LoL/__MAIN__/code/RiotClient/DevTools/VSCodeWorkspace/.p4config
    # https://www.notion.so/riotgames/LCU-Docs-Quickstart-Guide-9ea59338dd87496baddfb3a53b882ca7?pvs=4#203b7047ac5f4b21b6fb2a7c84551fd4
    PLUGINATOR_BIN=/Users/Shared/p4/depot/LoL/__MAIN__/DevRoot/Client/tools/pluginator/bin
    CT_BIN=/Users/Shared/p4/depot/LoL/__MAIN__/DevRoot/Client/tools/client-tools/bin
    NODE_BIN=/Users/Shared/p4/depot/LoL/__MAIN__/DevRoot/Client/tools/../../Tools/Ext/Node/22.2.0/mac/bin
    YARN_BIN=/Users/Shared/p4/depot/LoL/__MAIN__/DevRoot/Client/tools/../../Tools/Ext/Yarn
    export PATH="$PLUGINATOR_BIN:$CT_BIN:$LCP_BIN:$NODE_BIN:$YARN_BIN:$PATH"
fi
