local dap = require("dap")

dap.set_log_level("DEBUG")

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = 8123,
	executable = {
		command = "js-debug-adapter",
	},
}

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
			sourceMaps = true,
		},
		{
			name = "Next.js: debug server-side",
			type = "pwa-node",
			request = "launch",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "npm",
			runtimeArgs = { "run-script", "dev" },
			protocol = "inspector",
			port = 9229,
			sourceMaps = true,
			skipFiles = {
				"<node_internals>/**",
			},
		},
		{
			name = "Next.js: debug client-side",
			type = "pwa-chrome",
			request = "launch",
			url = "http://localhost:3000",
			webRoot = "${workspaceFolder}",
			sourceMaps = true,
			trace = true,
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
	}
end
