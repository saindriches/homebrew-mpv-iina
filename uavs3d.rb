# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Uavs3d < Formula
  desc "AVS3 decoder which supports AVS3-P2 baseline profile."
  homepage "http://www.avs.org.cn"
  license "BSD 3-Clause"
  head "https://github.com/saindriches/uavs3d.git"

  depends_on "cmake" => :build

  def install
    build_dir = "build/linux"
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "mkdir", build_dir
    system "cmake", "-S", ".", "-B", build_dir, *std_cmake_args, "-DCOMPILE_10BIT=1", "-DBUILD_SHARED_LIBS=YES"
    system "cmake", "--build", build_dir
    system "cmake", "--install", build_dir
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test uavs3d`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
