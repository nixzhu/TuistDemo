import ProjectDescription

let config = Config(
    compatibleXcodeVersions: [
        .upToNextMajor("16.1"),
    ],
    swiftVersion: "5.10",
    generationOptions: .options(
        resolveDependenciesWithSystemScm: true,
        disablePackageVersionLocking: true
    )
)
