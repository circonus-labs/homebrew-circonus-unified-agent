# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CirconusUnifiedAgent < Formula
  desc "Circonus Unified Agent"
  homepage "https://circonus.com"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.6/circonus-unified-agent_0.2.6_darwin_arm64.tar.gz"
      sha256 "eeb907e8a33c61a84e2c5b53991dcf8150bae8a62756d10876042b6715c6ee1d"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.6/circonus-unified-agent_0.2.6_darwin_x86_64.tar.gz"
      sha256 "7cf73cd66f082e7d16d459232dc4329025073a94c4a1b4cd5c59b5dae52e9872"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.6/circonus-unified-agent_0.2.6_linux_arm64.tar.gz"
      sha256 "227405759a897416eef1d730d7204e6414ced76b5e19d8cbbb3af47ec162878b"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/circonus-labs/circonus-unified-agent/releases/download/v0.2.6/circonus-unified-agent_0.2.6_linux_x86_64.tar.gz"
      sha256 "801c5c8e08a45c77952ae99c997c4254e99e153412c994b55d36afbc940ae59d"

      def install
        sbin.install "sbin/circonus-unified-agentd"
        pkgetc.install "etc/example-circonus-unified-agent.conf" => "circonus-unified-agent.conf"
        (pkgetc/"conf.d").mkpath
        doc.install "README.md", "LICENSE"
      end
    end
  end

  def caveats
    <<~EOS
      1. Edit #{plist_name} and add your API token in API_TOKEN environment variable setting
      2. Run "brew services start circonus-unified-agent"

      Or, if upgrading, run "brew services restart circonus-unified-agent"
    EOS
  end

  service do
    run [opt_sbin/"circonus-unified-agentd", "--config", etc/"circonus-unified-agent/circonus-unified-agent.conf", "--config-directory", etc/"circonus-unified-agent/conf.d"]
    keep_alive true
    log_path var/"log/circonus-unified-agent.log"
    error_log_path var/"log/circonus-unified-agent.log"
  end

  test do
    system "#{sbin}/circonus-unified-agentd --version"
  end
end
