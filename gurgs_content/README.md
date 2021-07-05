### Gurg's custom content!

Basically anything which may be overriden should go here, try your best to put your content into this folder.

This is because _gg or _g or any suffix to give to a file to override a _vg file will not work, this is because how the .dme file works.

If you are new to the simplicity of byond, this is how the .dme works.
It's just a fancy way to put every single .dm file into one big ass file and then it reads and compiles it. It does this using the #INCLUDE 'file'
It sorts out files alphabetically, so anything before _vg's overrides, will be overriden by _vg.

So this way, any code in gurgs_content is called after code, a complete override, this means, any code made in the main files would never be able to override these.

This isn't planned to be a unique codebase/foundation of code for other forks to downstream from, so this should be a reasonable method of being able to create content for the server.

Happy coding!~

- The mistake