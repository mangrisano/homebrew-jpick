class Jpick < Formula
  desc "Tiny jq-like JSON tool written in C++20"
  homepage "https://github.com/mangrisano/jpick"
  url "https://github.com/mangrisano/jpick/archive/refs/tags/v2.7.1.tar.gz"
  sha256 "f47a99f9b78563f9a7abb009e3e47d5d1e1382933b08268b52948f2bc7d60646"
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
