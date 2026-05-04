class M < Formula
  desc "MD-driven agent CLI for code, infrastructure, and automation"
  homepage "https://github.com/subzone/Agentctl"
  url "https://github.com/subzone/Agentctl/archive/refs/tags/v0.0.28.tar.gz"
  sha256 "d07a1953026d185c79eb1302f481de99b6def5a7cbf14e69ec2818e2166c6700"
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
