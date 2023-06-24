Instance: ex-organization
InstanceOf: Organization
Title: "Example Organization holding the data"
Description: "The Organization that holds the data, and enforcing any Consents"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* active = true
* name = "somewhere org"



Instance: ex-doctor
InstanceOf: Practitioner
Title: "Practitioner example doctor"
Description: "Practitioner example for the doctor."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* telecom.system = #email
* telecom.value = "JohnMoehrke@example.com"



// history - http://playgroundjungle.com/2018/02/origins-of-john-jacob-jingleheimer-schmidt.html
Instance:   ex-patient
InstanceOf: Patient
Title:      "Patient example"
Description: "Patient example for completeness sake."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name[+].use = #usual
* name[=].family = "Schmidt"
* name[=].given = "John"
* name[+].use = #old
* name[=].family = "Schnidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingle"
* name[=].given[+] = "Heimer"
* name[=].period.end = "1960"
* name[+].use = #official
* name[=].family = "Schmidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingleheimer"
* name[=].period.start = "1960-01-01"
* name[+].use = #nickname
* name[=].family = "Schmidt"
* name[=].given = "Jack"
* gender = #other
* birthDate = "1923-07-25"
* address.state = "WI"
* address.country = "USA"



Instance: ex-documentreference
InstanceOf: DocumentReference
Title: "DocumentReference Consent Paperwork example"
Description: "DocumentReference example of the paperwork of the Consent"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* type = http://loinc.org#64292-6 "Release of information consent"
* subject = Reference(Patient/ex-patient)
* author = Reference(Organization/ex-organization)
* description = "The captured signed document"
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain
* content.attachment.data = "TG9yZW0gaXBzdW0gZG9sb3Igc2l0IGFtZXQsIGNvbnNlY3RldHVyIGFkaXBpc2NpbmcgZWxpdCwgc2VkIGRvIGVpdXNtb2QgdGVtcG9yIGluY2lkaWR1bnQgdXQgbGFib3JlIGV0IGRvbG9yZSBtYWduYSBhbGlxdWEuIFV0IGVuaW0gYWQgbWluaW0gdmVuaWFtLCBxdWlzIG5vc3RydWQgZXhlcmNpdGF0aW9uIHVsbGFtY28gbGFib3JpcyBuaXNpIHV0IGFsaXF1aXAgZXggZWEgY29tbW9kbyBjb25zZXF1YXQuIER1aXMgYXV0ZSBpcnVyZSBkb2xvciBpbiByZXByZWhlbmRlcml0IGluIHZvbHVwdGF0ZSB2ZWxpdCBlc3NlIGNpbGx1bSBkb2xvcmUgZXUgZnVnaWF0IG51bGxhIHBhcmlhdHVyLiBFeGNlcHRldXIgc2ludCBvY2NhZWNhdCBjdXBpZGF0YXQgbm9uIHByb2lkZW50LCBzdW50IGluIGN1bHBhIHF1aSBvZmZpY2lhIGRlc2VydW50IG1vbGxpdCBhbmltIGlkIGVzdCBsYWJvcnVtLg=="
// Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


Instance: ex-consent
InstanceOf: PrivacyConsent
Title: "Simple Consent example"
Description: "Consent justifying authorizing access"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category[+] = http://loinc.org#64292-6 "Release of information consent"
* category[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#IDSCL
* patient = Reference(Patient/ex-patient)
* dateTime = "2022-06-13"
* performer = Reference(Patient/ex-patient)
* organization = Reference(Organization/ex-organization)
* sourceReference = Reference(DocumentReference/ex-documentreference)
* policy.uri = "http://example.org/policies/representative.xacml"
* provision.type = #permit


Profile: DeDegenerateConsent
Parent: Consent
Title: "Most Simple Patient Consent"
Description: "Consent constrained to just be a patient consent."
//* status = #active
//* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* patient 1..1
* dateTime 1..1
//* performer 1..
//* organization 1..

Profile: DegenerateConsent
Parent: Consent
Title: "Simple Consent Privacy with no provision"
Description: "Consent constrained minimally to be a patient privacy consent, forbidding any provisions."
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* patient 1..1
* dateTime 1..1
* performer 1..
* organization 1..
* provision 0..0

Profile: OneConsent
Parent: Consent
Title: "Simple Consent Privacy with root provision but nothing more"
Description: "Consent constrained minimally to be a patient privacy consent, with restriction on one level deep."
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* patient 1..1
* dateTime 1..1
* performer 1..
* organization 1..
* provision.provision 0..0

Profile: PrivacyConsent
Parent: Consent
Title: "Simple Consent Privacy with two provisions deep"
Description: "Consent constrained minimally to be a patient privacy consent, with restriction of provisions only two levels deep."
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* patient 1..1
* dateTime 1..1
* performer 1..
* organization 1..
* provision 1..1
* provision.provision MS 
* provision.provision.provision 0..0


CodeSystem: OtherActivity
Title: "One code to identify an activity of profile validating"
Description: "one more code"
* ^caseSensitive = true
* ^experimental = false
* #FhirProfileValidation "FHIR Profile Validation"




Instance: ex-consent-2
InstanceOf: PrivacyConsent
Title: "Consent example with two provisions deep"
Description: "This consent is legal Consent, and legal profiled PrivacyConsent"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category[+] = http://loinc.org#64292-6 "Release of information consent"
* category[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#IDSCL
* patient = Reference(Patient/ex-patient)
* dateTime = "2022-06-13"
* performer = Reference(Patient/ex-patient)
* organization = Reference(Organization/ex-organization)
* sourceReference = Reference(DocumentReference/ex-documentreference)
* policy.uri = "http://example.org/policies/representative.xacml"
* provision.type = #permit
* provision.provision.type = #deny
* provision.provision.dataPeriod.start = 2022-01
* provision.provision.dataPeriod.end = 2022-12




Instance: ex-consent-3
InstanceOf: Consent
Title: "Consent example with three provisions deep"
Description: "This consent is legal Consent, but not to the profiled PrivacyConsent"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category[+] = http://loinc.org#64292-6 "Release of information consent"
* category[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#IDSCL
* patient = Reference(Patient/ex-patient)
* dateTime = "2022-06-13"
* performer = Reference(Patient/ex-patient)
* organization = Reference(Organization/ex-organization)
* sourceReference = Reference(DocumentReference/ex-documentreference)
* policy.uri = "http://example.org/policies/representative.xacml"
* provision.type = #permit
* provision.provision.type = #deny
* provision.provision.dataPeriod.start = 2022-01
* provision.provision.dataPeriod.end = 2022-12
* provision.provision.provision.type = #permit
* provision.provision.provision.dataPeriod.start = 2022-12


