class Elgato < Formula
  desc "A command line too to control the elgato key lights"
  homepage "https://github.com/aitorvs/elgato"
  url "https://github.com/aitorvs/elgato/releases/download/0.2.2/elgato-0.2.2-binary.jar"
  version "0.2.2"
  sha256 "607d6d46a033fcb680bbc8e9ad4bc9d68c5d30da15aa4dbcef00ed9e0a4d1f8e"

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
