class Jpick < Formula
  desc "Tiny jq-like JSON tool written in C++20"
  homepage "https://github.com/mangrisano/jpick"
  url "https://github.com/mangrisano/jpick/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "20e30e9bd04b64c31dcca676edbd1bfdb134ee9a2362fc037589644726e9731d"
  license "MIT"
  head "https://github.com/mangrisano/jpick.git", branch: "main"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_equal "42", pipe_output("#{bin}/jpick .a", '{"a":42}', 0).strip
  end
end
