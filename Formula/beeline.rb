class Beeline < Formula
  desc "A tool for creating network routes that exclude given subnets"
  homepage "https://github.com/aitorvs/beeline"
  url "https://github.com/aitorvs/beeline/releases/download/0.2.0/beeline-0.2.0-binary.jar"
  version "0.2.0"
  sha256 "c9a1cfeb0637160240c2e223937a59c78b2ac0d731f0d050491fd5080ebe558e"

  bottle :unneeded

  depends_on "openjdk"

  def install
  	mv "beeline-#{version}-binary.jar", "beeline.jar"
    libexec.install "beeline.jar"
    bin.write_jar_script libexec/"beeline.jar", "beeline"
  end

  test do
    output = shell_output("#{bin}/beeline --help")
    assert_includes output, "Usage: beeline"
  end
end