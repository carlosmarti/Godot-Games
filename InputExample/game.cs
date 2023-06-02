using Godot;
using System;
using System.Security.AccessControl;

public partial class game : Node2D
{

	public int halfScreenX = 320;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public override void _Input(InputEvent @event)
	{
		ColorRect colorRectGreen = GetNodeOrNull<ColorRect>("Green");
		ColorRect colorRectPurple = GetNodeOrNull<ColorRect>("Purple");
		if(colorRectGreen is null || colorRectPurple is null)
		{
			return;
		}
		
		if(@event is InputEventMouseButton mouseEvent && mouseEvent.ButtonIndex == MouseButton.Left)
		{
			if(mouseEvent.Pressed)
			{
				if(mouseEvent.Position.X < halfScreenX)
				{
					GD.Print("Mouse down on:" + colorRectGreen.Name);
				}
				else if(mouseEvent.Position.X > halfScreenX)
				{
					GD.Print("Mouse down on:" + colorRectPurple.Name);
					GD.Print(mouseEvent.Position.X);
				}
			}
			
		}
	}
}
