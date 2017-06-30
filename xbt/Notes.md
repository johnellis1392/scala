# XBT directory structure:
.xbt/
    target/
        ... Class files
    config/
        ...
    manifest.json

* [manifest.json]   File containing manifest configuration information for
                    the project.


# Api:

```
xbt run # Compile and run project
xbt compile # Compile project
xbt test # Run tests
xbt new [name] # Generate new project
xbt init # Turn current directory into xbt project
xbt help # Print help information for a particular command
xbt loop # Rerun command on file change

xbt project # Print project attributes

xbt get # Get configuration object or project file
xbt get deps # Get dependency list for project
xbt get dependencies # Same as above
xbt get packages # Same as above

xbt package # Perform package operations
xbt package install [name] # Install package
xbt package uninstall [name] # Uninstall package
xbt install [name] # Same as `package install`
xbt uninstall [name] # Same as `package uninstall`

xbt package list # Same as `get packages`
xbt package search # Search for packages

xbt resolve # Resolve dependencies
xbt resolvers list # List all resolvers for project
xbt get resolvers # Same as `resolvers list`

```

# Manifest structure

```
{
    "resolvers": [
        {
            "name": String,
            "url": String,
        },
    ],
    "dependencies": [
        {
            "groupId": String,
            "artifactId": String,
            "version": String,
            "minVersion": String,
            "maxVersion": String,
            "updated": String,
        },
    ],

}
```

## Example Manifest
```
{
    "resolvers": [
        {
            "name": "maven",
            "url": "https://search.maven.org",
            "searchUrl": {
                "base": "/solrsearch/select",
                "params": {
                    "q": "String",
                    "rows": "Number",
                    "wt": ["json"]
                }
            }
        },
    ],
    "dependencies": [
        {
            "groupId": "org.scalatest",
            "artifactId": "scalatest",
            "version": "1.4.RC2",
            "updated": "26-Apr-2011",
            "minVersion": null,
            "maxVersion": null,
        },
    ],
}
```

## Example search query

xbt search scalatest resolver=maven
=> curl -X GET https://search.maven.org/solrsearch/select?q=scalatest&rows=20&wt=json

### Example response from search.maven.org
```
{
    "response": {
        numFound: Number,
        docs: [
            {
                a: "scalatest",
                ec: ["-javadoc.jar", "-sources.jar", ...],
                g: "org.scalatest",
                id: "org.scalatest:scalatest",
                latestVersion: "1.4.RC2",
                p: "jar",
                repositoryId: "central",
                text: ["org.scalatest", "scalatest", "-javadoc.jar", ...],
                timestamp: ...,
                versionCount: 14,
            }
        ]
    },
    "responseHeader": {
        status: 0,
        QTime: 121,
        params: {...}
    },
    "spellcheck": {
        suggestions: [String],
    },
}
```
