# coding: utf-8
# Copyright (c) 2016, 2020, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl 
# or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

import os
import requests
from dotenv import load_dotenv
from oci.signer import Signer

from oracle_instance_specs import getSpecs

load_dotenv()

auth = Signer(
tenancy=os.getenv('OCI_TENANCY_ID'),
user=os.getenv('OCI_USER_ID'),
fingerprint=os.getenv('OCI_KEY_FINGERPRINT'),
private_key_file_location=os.getenv('OCI_PRIVATE_KEY_FILENAME'),
pass_phrase=os.getenv('OCI_PASSPHRASE')
)

endpoint = os.getenv('OCI_ENDPOINT')

body = getSpecs()
response = requests.post(endpoint, json=body, auth=auth)

print(response.text)
