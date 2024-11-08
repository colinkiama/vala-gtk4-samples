# Vala GTK4 Samples

Some of these samples are featured in the [Vala Documentation Website](https://docs.vala.dev).

View the repository for the website here: https://github.com/vala-lang/vala-docs

## Structure

Top-level directories should are:

- `/vala` - Samples where Vala is used to create the UI
- `/blp` - Samples where Blueprint is used to create the UI

Each top-level repository is split into two directories:

- `/gtk4` - Samples that use standard gtk4 code exist
- `/adw` - Samples that use Libadwaita code

In each of the directories (gtk4 and adw), there are directories for each sample.

## Trying out the samples

While samples should aim to be complied without a build system, some samples may use a build system if they are a bit too complex to setup.

The primary build system that will be used for these samples is [`Meson`](https://mesonbuild.com).

Each sample project directory in this repo will have its own README, including instructions on how to build and run the samples.

## Contributing

Feel free to suggest changes using issues and add/update samples with pull requests.

## Resources

- [Valadoc - Vala API References Website](https:/valadoc.org).
- [GTK Documentation](https://docs.gtk.org/)
- [Blueprint Documentation](https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/index.html)
- [Vala Documentation Website](https://docs.vala.dev)

