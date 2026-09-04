#include <torch/extension.h>

__global__ void add_kernel(const float *input1, const float *input2, float *output, int size) {
  const int idx = blockIdx.x * blockDim.x + threadIdx.x;
  if (idx < size)
    output[idx] = input1[idx] + input2[idx];
}

torch::Tensor add(torch::Tensor input1, torch::Tensor input2) {
  int size = input1.numel();
  int threads_per_block = 256;
  int blocks_per_grid = cuda::ceil_div(size, threads_per_block);
  torch::Tensor output = torch::empty(size, input1.options());
  add_kernel<<<blocks_per_grid, threads_per_block>>>(input1.data_ptr<float>(), input2.data_ptr<float>(),
                                                     output.data_ptr<float>(), size);
  return output;
}

PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) { m.def("add", &add, "Add two vectors"); }
