class Shotty < Formula
  desc "Turn the output of any command into a PNG or JPG image"
  homepage "https://github.com/phranck/shotty"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phranck/shotty/releases/download/v0.3.0/shotty-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "04a8d4c3393ea709de3840f764066dab235bc4004018a3599fffecfa7ea34053"
    end
    on_intel do
      url "https://github.com/phranck/shotty/releases/download/v0.3.0/shotty-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "ccd897afd92176331129315ac2c3bc0f5a009900650ac96c6db37d574563d250"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phranck/shotty/releases/download/v0.3.0/shotty-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d9e5774602d6e99bf2b4e133d982dbc0efa41e7c240098037a2e53e368c461e"
    end
    on_intel do
      url "https://github.com/phranck/shotty/releases/download/v0.3.0/shotty-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbb65fb7f3be7127f7b340bda893bb016253a20ddcfa5182b68cebe1de7aec84"
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
