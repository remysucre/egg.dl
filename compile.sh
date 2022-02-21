SOUFFLE_PATH=../souffle/build/src/

# change -jN to use N threads
$SOUFFLE_PATH/souffle -p out.log $1 -g out.cpp
tail -n +7 out.cpp > out-stub.cpp
cat helper.lines out-stub.cpp > out.cpp
printf "#define eqfind(x) `grep -m 1 -o rel_[0-9]*_eql out.cpp`->ind.findNode(x)" > helper.h
$SOUFFLE_PATH/souffle-compile out.cpp ./out
