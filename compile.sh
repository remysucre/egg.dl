SOUFFLE_PATH=../souffle/build/src/

$SOUFFLE_PATH/souffle math.dl -g out.cpp
tail -n +7 out.cpp > out-stub.cpp
cat helper.lines out-stub.cpp > out.cpp
$SOUFFLE_PATH/souffle-compile out.cpp ./out
