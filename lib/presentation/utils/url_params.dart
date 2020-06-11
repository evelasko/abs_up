/// Replace a url (https://mywebsite.com/page) into a string
/// usable in route params (https:||mywebsite.com|page)
String encodeUrlForParams(String url) => url.replaceAll('/', '|');

/// Replace a url encoded for use in params to the original
String decodeUrlFromParams(String encoded) => encoded.replaceAll('|', '/');
