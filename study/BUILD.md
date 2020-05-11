
64bit Mac OS X 10.14.6 18G4032
bazel v3.0.0

⇒  bazel build --config=monolithic --config=opt -c dbg --strip=never --config=noaws --config=nogcp --config=nohdfs --config=nonccl --cxxopt=-D_GLIBCXX_USE_CXX11_ABI=0 //tensorflow:libtensorflow_cc.so
