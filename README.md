Rebuild souffle with the following change:
in `src/include/souffle/datastructure/EquivalenceRelation.h`, add a method:
```
    /**
     * Returns unionfind parent of Node
     * @param x
     */
    value_type findNode(value_type x) const {
        if (!sds.nodeExists(x)) return x;
        return sds.findNode(x);
    }
```
to the `EquivalenceRelation` class.

Change `SOUFFLE_PATH` in compile.dl to point to the directory containing the `souffle` and 
`souffle-compile` binaries.

Compile with `./compile.dl program.dl`, then run with `./out`.

There are two versions implementing eqsat for math: `correct.dl` and `fast.dl`. 
As the name suggests, `correct.dl` is correct but slow.
`fast.dl` is incorrect because it misses some tuples, but is very fast.
The difference between them is that `correct.dl` properly canonizes e-nodes, 
whereas `fast.dl` only drops e-nodes subsumed by more canonical ones.
