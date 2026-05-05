class M < Formula
  desc "MD-driven agent CLI for code, infrastructure, and automation"
  homepage "https://github.com/subzone/Agentctl"
  url "https://github.com/subzone/Agentctl/archive/refs/tags/v0.0.29.tar.gz"
  sha256 "96ed8c8a98deb22250aaae46e9fe9733ecdd328a39df464345fbe82110fb8fe7"
  license "MIT"
  head "https://github.com/subzone/Agentctl.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "-o", bin/"m", "./cmd/m"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/m --version")
  end
end
