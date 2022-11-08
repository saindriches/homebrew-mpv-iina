# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Davs2 < Formula
  desc "An open-source decoder of AVS2-P2/IEEE1857.4 video coding standard"
  homepage "http://www.avs.org.cn"
  license "GPL-2.0"
  head "https://github.com/saindriches/davs2.git"

  on_intel do
    depends_on "nasm" => :build
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-cli
      --enable-shared
      --disable-static
      --bit-depth=10
      --enable-pic      
    ]

    build_dir = "build/linux"
    # ENV.deparallelize  # if your formula fails when building in parallel

    cd build_dir do
      system "./configure", *args
      system "make", "install"
    end
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
