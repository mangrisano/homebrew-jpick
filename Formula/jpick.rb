class Jpick < Formula
  desc "Tiny jq-like JSON tool written in C++20"
  homepage "https://github.com/mangrisano/jpick"
  url "https://github.com/mangrisano/jpick/archive/refs/tags/v2.9.2.tar.gz"
  sha256 "77846b076cda37b5b3fc04b975bc313d387931b48bf901dc82ff9298c01bcc5a"
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
