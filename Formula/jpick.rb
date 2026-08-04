class Jpick < Formula
  desc "Tiny jq-like JSON tool written in C++20"
  homepage "https://github.com/mangrisano/jpick"
  url "https://github.com/mangrisano/jpick/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "d777701920a1e082e7bc1364bea647560a1304b3d4cbe6010236b750be5e7609"
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
