# Allows Direct Interaction Example

A Demo for [Flutter Issue
76149](https://github.com/flutter/flutter/issues/76149#issuecomment-780921182)

## Motivation

Music applications have visual parts that need to react without delay. For
example, a drum pad on the screen should directly play a sound when tapped. When
VoiceOver or TalkBack is enabled, user interactions on visual elements are
strongly delayed making music applications impossible to be used by blind
people. This code demonstrates the issue and proposes how to solve the problem.

## Description of the Demo

The Demo shows a "Drum Pad". When tapped, the pad changes its color from red to
white without any perceived delay.

If "Voice Over" is enabled on iOS, the drum pad is not usable anymore. 

We need a flag that tells flutter to exclude the drum pad from being treated by
accessibility/screen readers.

In a native iOS App I used the following property of an `UIView` to allow direct
and undelayed interaction with a UIView:

~~~ObjectiveC
self.accessibilityElementsHidden = NO;
self.accessibilityViewIsModal = NO;
self.isAccessibilityElement = YES;
self.accessibilityTraits = UIAccessibilityTraitAllowsDirectInteraction;
~~~

While experimenting with the properties of a `Semantics` widget, I did not find
any way to achieve the desired result. 

## What we need

a) If not existing, something like an `allowsDirectInteraction` property on
`Semantics` widget is needed to tell the system to let widgets react to user
input the same way, no matter if Voice Over/TalkBack is enabled or not.

b) If existing, the Flutter documentation needs to be updated to show how a
`Semantics` Widget can be configured to allow direct interaction.
