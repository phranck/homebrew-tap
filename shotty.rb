class Shotty < Formula
  desc "Turn the output of any command into a PNG or JPG image"
  homepage "https://github.com/phranck/shotty"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phranck/shotty/releases/download/v0.2.0/shotty-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2b4db665a638c1a522eeed46a55ac01ce97627253bb10999cc11089996964791"
    end
    on_intel do
      url "https://github.com/phranck/shotty/releases/download/v0.2.0/shotty-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ee8e37d3db0944c8a2a67d70407cb7fdb7233c7fcb320c9437962c48cc4a98f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phranck/shotty/releases/download/v0.2.0/shotty-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a98e441809145fc84dde440da7ade29960d6b00c48eccf94c450442820208d31"
    end
    on_intel do
      url "https://github.com/phranck/shotty/releases/download/v0.2.0/shotty-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09eed42bd7329202cce71460e6fa9fb3b5354ac2f37d122f03eca36a17aedd39"
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
