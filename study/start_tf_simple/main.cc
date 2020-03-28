#include <iostream>
#include <vector>

#include "add.hpp"


int main(int argc, char* argv[]) {

    if(argc < 2) {
        add_usage();
        return EXIT_FAILURE;
    }

    const char* model_file = argv[1];
    std::cout << "using model file: " << model_file << std::endl;

    tensorflow::Session* session = PrepareSession(model_file);
    if(!session) {
        std::cout << "[ERROR] PrepareSession failed." << std::endl;
        return EXIT_FAILURE;
    }

    if(!WarmUpSession(session)) {
        std::cout << "[ERROR] WarmupSession failed." << std::endl;
        return EXIT_FAILURE;
    }

    std::vector<int32_t> vec1{1, 3, 9};
    std::vector<int32_t> vec2{3, 5, 7};

    if(!RunInference(session, vec1, vec2)) {
        std::cout << "[ERROR] RunInference failed." << std::endl;
        return EXIT_FAILURE;
    }

    CloseSession(session);

    std::cout << "[INFO] Tensorflow Inference finished." << std::endl;
    return EXIT_SUCCESS;
}
