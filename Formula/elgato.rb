class Elgato < Formula
  desc "A command line too to control the elgato key lights"
  homepage "https://github.com/aitorvs/elgato"
  url "https://github.com/aitorvs/elgato/releases/download/0.0.1/elgato-0.0.1-binary.jar"
  version "0.0.1"
  sha256 "add3f819fe505888ce5452d539ab2ad925b0b44352979a9132c9d3be29c7e527"

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
