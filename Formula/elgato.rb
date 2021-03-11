class Elgato < Formula
  desc "A command line too to control the elgato key lights"
  homepage "https://github.com/aitorvs/elgato"
  url "https://github.com/aitorvs/elgato/releases/download/0.2.3/elgato-0.2.3-binary.jar"
  version "0.2.3"
  sha256 "e60a3b169b69d5fd574677992db4f9832ad18566158e191cb736349937d71aa5"

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
