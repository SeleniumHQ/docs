The Java Support Package
========================

Working With Colours
--------------------

You will occasionally want to validate the colour of a thing as part of your tests, the problem is that colour definitions on the web are not constant.  Wouldn't it be nice if there was an easy way to compare a hex representation of a colour with an RGB representation of a colour, or an RGBA representation of a colour with a HSLA representation of a colour.

Worry not there is a solution, the Colour class!

First of all you will need to import the colour class

```java
    import org.openqa.selenium.support.Color
```

You can now start creating colour objects, every colour object will need to be created from a string representation of your colour, supported colour representations are:

```java
    private final Color HEX_COLOUR = Color.fromString("#2F7ED8");
    private final Color RGB_COLOUR = Color.fromString("rgb(255, 255, 255)");
    private final Color RGB_COLOUR = Color.fromString("rgb(40%, 20%, 40%)");
    private final Color RGBA_COLOUR = Color.fromString("rgba(255, 255, 255, 0.5)");
    private final Color RGBA_COLOUR = Color.fromString("rgba(40%, 20%, 40%, 0.5)");
    private final Color HSL_COLOUR = Color.fromString("hsl(100, 0%, 50%)");
    private final Color HSLA_COLOUR = Color.fromString("hsla(100, 0%, 50%, 0.5)");
```

The Color package also supports all of the base colour definitions specified at [http://www.w3.org/TR/css3-color/#html4].

```java
    private final Color BLACK = Color.fromString("black");
    private final Color CHOCOLATE = Color.fromString("chocolate");
    private final Color HOTPINK = Color.fromString("hotpink");
```

Sometimes browsers will return a colour value of transparent if no colour has been set on an element, the Color package also supports this

```java
    private final Color TRANSPARENT = Color.fromString("transparent");
```

You can now safely query an element to get its colour/background colour knowing that any response will be correctly parsed and converted into a valid Color object:

```java
    Color loginButtonColour = driver.findElement(By.id("login")).getCssValue("color");
    Color loginButtonBackgroundColour = driver.findElement(By.id("login")).getCssValue("background-color");
```

You can then directly compare colour objects:

```java
    assert loginButtonBackgroundColour.equals(HOTPINK);
```

Or you can convert the colour into one of the following formats and perform a static validation:

```java
    assert loginButtonBackgroundColour.asHex().equals("#ff69b4");
    assert loginButtonBackgroundColour.asRgba().equals("rgba(255, 105, 180, 1)");
    assert loginButtonBackgroundColour.asRgb().equals("rgb(255, 105, 180)");
```

Colours are no longer a problem
