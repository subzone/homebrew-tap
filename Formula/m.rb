class M < Formula
  desc "MD-driven agent CLI for code, infrastructure, and automation"
  homepage "https://github.com/subzone/Agentctl"
  url "https://github.com/subzone/Agentctl/archive/refs/tags/v0.0.25.tar.gz"
  sha256 "2f5bd62e03022f5805509ed0c12878234359ab6fcf6a0c75314945a215401674"
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
