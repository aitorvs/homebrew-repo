class Elgato < Formula
  desc "A command line too to control the elgato key lights"
  homepage "https://github.com/aitorvs/elgato"
  url "https://github.com/aitorvs/elgato/releases/download/0.1.0/elgato-0.1.0-binary.jar"
  version "0.1.0"
  sha256 "a09d8287caf22d1027c0762d143a4da32045f9d9fdaca21a1ae8455d0288840a"

  bottle :unneeded

  depends_on "openjdk"

  def install
  	mv "elgato-#{version}-binary.jar", "elgato.jar"
    libexec.install "elgato.jar"
    bin.write_jar_script libexec/"elgato.jar", "elgato"
  end

  test do
    output = shell_output("#{bin}/elgato --help")
    assert_includes output, "Usage: elgato"
  end
end
