AboutUs Dashboard
=================

The AboutUs Dashboard is a Rails 3 application that provides a simple
reporting interface for trackable metrics. Features plenty of
Helvetica and a bit of sparkline.

The dashboard is organized with `Perspectives`. A perspective is a
customized view of data points stored in the database. This allows
for different dashboards to present the same data, but highlight it in
different ways. For instance, one perspective can show a sparkline of
a datapoint that another perspective merely exposes as a number.

Usage
-----

Once the Dashboard is up and running, visit the URL in a web browser
to create a new perspective. No data points will be present. These can
either be created by visiting `/data_points/new` and manually entering
values, or by `POST`ing a JSON string to `/dashboard`. Each data point
consists of 3 attributes: a `Family`, which is a namespace for the
data point, a `Name`, which is the specific name for the data point,
and a `Value`, which represents the data point's value at this point
in time.

If posting to `/dashboard`, format the JSON string as follows:

    { "collection": "Foo", "Bar": 13 }

In this format, 'Foo' represents the Family, 'Bar' represents the
Name, and the Value is 13.

Multiple values within the same Family may be posted at the same time
by putting multiple entries in the JSON post.

    { "collection": "Foo", "Bar": 13, "Baz": "Hello, word!" }


Problems?
---------

Run into issues? Please use the GitHub 'Issues' interface to let us
know about problems. We'll be happy to help.

License
-------

Licensed under the MIT License.
