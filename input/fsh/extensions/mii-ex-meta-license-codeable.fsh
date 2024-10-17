Extension: MII_EX_Meta_License_Codeable
Id: mii-ex-meta-license-codeable
Title: "MII EX Meta License Codeable"
Description: """
    This extension may be used to provide machine-processable license information about the set of data described by this resource.
    The extension is a R4-compatible version of the FHIR for FAIR R4B IG Licence Terms as CodeableConcept extension.
    """
* insert Publisher
* insert PR_CS_VS_Version
* insert LicenseCodeableCCBY40
* ^date = "2024-10-17"
* insert ExtensionContext(Element)
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/spdx-license (preferred)