# G3D
G3D_DIR=/home/tyler/G3D9
export PATH=$PATH:$G3D_DIR/bin
export CPATH=$CPATH:$G3D_DIR/include
export LIBRARY_PATH=$LIBRARY_PATH:$G3D_DIR/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$G3D_DIR/lib
export G3D9DATA=$G3D_DIR/G3D/data
alias g3dRun="./build/*"
alias icompileR="icompile;g3dRun"
