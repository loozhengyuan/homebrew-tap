class Unwarp < Formula
    desc "Disable Cloudflare WARP on macOS"
    homepage "https://github.com/loozhengyuan/unwarp"
    url "https://github.com/loozhengyuan/unwarp.git",
        # tag: "v0.1.0"
        revision: "a096ae302b45a3201eaa05fa0ada9b4cfd76b116"
    head "https://github.com/loozhengyuan/unwarp.git",
        branch: "main"
    version "0.1.0"
    license "MIT"

    def install
        bin.install "src/unwarp.sh" => "unwarp"
    end

    service do
        run opt_bin/"unwarp"
        keep_alive successful_exit: true
        environment_variables PATH: std_service_path_env
        log_path var/"log/unwarp.log"
        error_log_path var/"log/unwarp.log"
    end

    test do
        assert_match version.to_s, shell_output("#{bin}/unwarp -v 2>&1")
    end
end
