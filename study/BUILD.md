
build with dbg info:   
```bash
bazel build --config=monolithic --config=opt -c dbg --strip=never --config=noaws --config=nogcp --config=nohdfs --config=nokafka --config=noignite --config=nonccl --cxxopt=-D_GLIBCXX_USE_CXX11_ABI=0 //tensorflow:libtensorflow_cc.so
```
