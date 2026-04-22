import click

@click.group()
def cli():
    """A customizable CLI tool."""
    pass

@cli.command()
def hello():
    """A sample command."""
    click.echo("Hello, world!")

if __name__ == '__main__':
    cli()