class Shotty < Formula
  desc "Turn the output of any command into a PNG or JPG image"
  homepage "https://github.com/phranck/shotty"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phranck/shotty/releases/download/v0.3.1/shotty-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "a0abf3c81b7d83fab67378681b82744d6c9a0f8f15125221fcd3b0a813b8e0a7"
    end
    on_intel do
      url "https://github.com/phranck/shotty/releases/download/v0.3.1/shotty-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "b1b8f439c5225f7d0cb1d2c6925863d5fa5824f2107043199e1ed118886d18a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phranck/shotty/releases/download/v0.3.1/shotty-0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a868ce8d7d6b185b978467adf87fe42f6a7a0fd9c81bbb83d02d5723c3c2bdc5"
    end
    on_intel do
      url "https://github.com/phranck/shotty/releases/download/v0.3.1/shotty-0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33777332d79c4de794875368d84eba3239ef3aa3ab04fd72179ad0bec05eb152"
    end
  end

  def install
    bin.install "shotty"
    man1.install Dir["man/*.1"]
    generate_completions_from_executable(bin/"shotty", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shotty version")
    pipe_output("#{bin}/shotty -o #{testpath}/out.png", "hello\n")
    assert_path_exists testpath/"out.png"
  end
end
