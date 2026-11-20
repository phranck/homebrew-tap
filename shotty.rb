class Shotty < Formula
  desc "Turn the output of any command into a PNG or JPG image"
  homepage "https://github.com/phranck/shotty"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phranck/shotty/releases/download/v0.1.0/shotty-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f9bc39aa852c82e14630c4e415172c811daea1d55b27f051a9aee93c96d64fcd"
    end
    on_intel do
      url "https://github.com/phranck/shotty/releases/download/v0.1.0/shotty-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "b115ab69b7df4f310766f84bb2e9b263459a918e13020377da0ddb33e24e37eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phranck/shotty/releases/download/v0.1.0/shotty-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd09ae82ff7a0cc3cb8d3328a7be4724d2e2966b9c151606c05c2f40193550dc"
    end
    on_intel do
      url "https://github.com/phranck/shotty/releases/download/v0.1.0/shotty-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62c673a90e2bcca0d6715d4543653deb96b4bd9245587fa1dc4e39eb4a2ec2a3"
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
