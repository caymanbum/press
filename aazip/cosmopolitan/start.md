# Clone this repo just to start

```
git clone https://github.com/eliotmuirgrid/flowlua
```


```
export FLOW_TOOL_COSMOPOLITAN=$HOME/flowtools/cosmopolitan
local dir="$FLOW_TOOL_COSMOPOLITAN" 
mkdir -p   $dir
pushd      $dir
curl -L -O https://cosmo.zip/pub/cosmocc/cosmocc.zip
unzip cosmocc.zip 
rm    cosmocc.zip
popd 
```
