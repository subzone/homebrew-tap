class M < Formula
  desc "MD-driven agent CLI for code, infrastructure, and automation"
  homepage "https://github.com/subzone/Agentctl"
  url "https://github.com/subzone/Agentctl/archive/refs/tags/v0.0.32.tar.gz"
  sha256 "bf6ae7958cd85395a6e5b7f70b56efb2d0a013d2b4c1ca4de1f1424c570b4bc3"
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
