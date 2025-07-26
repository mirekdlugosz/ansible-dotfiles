return {
    settings = {
        python = {
            analysis = {
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = "none",
                    reportOptionalMemberAccess = "none",
                    reportOptionalSubscript = "none",
                    reportPrivateImportUsage = "none",
                },
                autoImportCompletions = false,
            },
            linting = {
                pylintEnabled = false
            },
        },
    },
}
