# testConsent

**FIXED WITH IG BUILDER 126**

Consent testing for error.

ci-build - http://build.fhir.org/ig/JohnMoehrke/testConsent/branches/main/index.html


### R4 error

BUilding with R4 will result in a known profiling bug that gives the error
> if identifier.system is ''urn:ietf:rfc:3986'', then the identifier.value must be a full URI (e.g. start with a scheme)

### R4B error

Build with R4B will result in a known profiling bug that will give you the error
> sdf-24: 'For CodeableReference elements, target profiles must be listed on the CodeableReference, not the CodeableReference.reference' 'For CodeableReference elements, target profiles must be listed on the CodeableReference, not the CodeableReference.reference' (Index 0 out of bounds for length 0)

### Not your fault

There is nothing an IG can do about either of these. The R4B included a technical-correction to address the R4 problem. But R4B introduced a fully unrelated error.

Note that the Consent can hold examples. It just produces errors on profiling.

### also note with R4B publisher

Odd that the Consent.sourceReference seems to have some strangeness too. When I use it, I get an error thrown by the IG builder, although it does not show up in the QA report
> Unable to convert resource Consent/ex-consent property sourceReference is a class com.google.gson.JsonObject looking for an Array (01:13.793)

this does not happen with R4 build

# Provenance resources do not show on the artifacts page

see [example](Provenance-ex-provenance.html)