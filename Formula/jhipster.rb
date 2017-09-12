require "language/node"

class Jhipster < Formula
  desc "Generate, develop and deploy Spring Boot + Angular applications"
  homepage "https://jhipster.github.io/"
  url "https://registry.npmjs.org/generator-jhipster/-/generator-jhipster-4.8.0.tgz"
  sha256 "26a5061c681aae0336702ca01c8781d5f86e73e6e1cbb207a1876611c86f0c09"

  bottle do
    cellar :any_skip_relocation
    sha256 "f50de613bba092d6131e107ccae4e3c723d7929164db2486e53cbf3e6ba75a52" => :sierra
    sha256 "f02194104cc65f65278891aafa969a8d8cce594907adcddf298dddf3030c8415" => :el_capitan
    sha256 "96444c84d95b33c80256aadf04e900ee9a60b2a7121b493e497f49e10afb4d53" => :yosemite
  end

  depends_on "node"
  depends_on "yarn"
  depends_on :java => "1.8+"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Execution complete", shell_output("#{bin}/jhipster info")
  end
end
