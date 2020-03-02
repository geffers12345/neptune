<%@ Page Title="Add Applicant" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="add_applicant.aspx.cs" Inherits="Seabase.add_applicant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form runat="server">
    <div class="content-wrapper div-manning">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title animated slideInRight">Add New Applicant</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-wrench"></i>
                                        </button>
                                    </div>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="form-group">

                                        <div class="col-md-4">
                                            <label class="text-primary">Application Date</label><br />
                                            <input type="date" id="date" class="form-control" data-name="Date"/>
                                            <label id="error-date" style="display: none" class="text-danger"></label>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Position/Rank Applying</label><br />
                                            <select id="position" class="form-control" data-name="Rank">

                                            </select>
                                        </div>

                                        <div class="col-md-4 hidden">
                                            <label class="text-primary">Status</label><br />
                                            <select id="status" class="form-control" data-name="Status">
                                                <option value="1">New</option>
                                                <option value="2">On Board</option>
                                                <option value="3">On Vacation</option>
                                                <option value="4">On Training</option>
                                                <option value="5">Old Crew/Resigned</option>
                                                <option value="7">Available</option>
                                                <option value="8">Pool</option>
                                                <option value="9">Operation</option>
                                            </select>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Last Name</label><br />
                                            <input type="text" id="lastname" class="form-control" data-name="Last Name" placeholder="Last Name"/>
                                            <label id="error-lname" style="display: none" class="text-danger"></label>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">First Name</label><br />
                                            <input type="text" id="firstname" class="form-control" data-name="First Name" placeholder="First Name"/>
                                            <label id="error-fname" style="display: none" class="text-danger"></label>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Middle Name</label><br />
                                            <input type="text" id="middlename" class="form-control" data-name="Middle Name" placeholder="Middle Name"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Upload Picture:</label><br />
                                            <asp:FileUpload runat="server" id="picture" class="form-control" data-name="Picture"/>
                                            <label id="error-picture" style="display: none" class="text-danger"></label>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Email Address</label><br />
                                            <input type="text" id="email" class="form-control" placeholder="Email" data-name="Email"/>
                                            <label id="error-email" style="display: none" class="text-danger"></label>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Password <span class="text-danger">(for crew portal)</span></label><br />
                                            <input type="text" id="password" class="form-control" placeholder="Password" data-name="Password" disabled/>
                                            <label id="error-password" style="display: none" class="text-danger"></label>
                                        </div>

                                        <div class="col-md-8 hidden">
                                            <label class="text-primary">Address</label><br />
                                             <input type="text" id="address" class="form-control" data-name="Address" placeholder="Address"/>
                                            <label id="error-address" style="display: none" class="text-danger"></label>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Telephone Number</label><br />
                                            <input type="text" id="contact" class="form-control" placeholder="Telephone Number"/>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="text-primary">Passport Number</label><br />
                                            <input type="text" id="passport" class="form-control" placeholder="Passport Number"/>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="text-primary">Seaman's Book Number</label><br />
                                            <input type="text" id="seamans" class="form-control" placeholder="Seman's Book Number"/>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="text-primary">SRC Number</label><br />
                                            <input type="text" id="src" class="form-control" placeholder="SRC Number"/>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="text-primary">E-registration Number</label><br />
                                            <input type="text" id="eregistration" class="form-control" placeholder="E-Registration"/>
                                        </div>

                                        <div class="col-md-12">
                                            <h4><i>Permanent Address</i></h4>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">No./Bldg.</label><br />
                                            <input type="text" id="no-bldg" class="form-control" placeholder="No./Bldg"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Street/Barangay</label><br />
                                            <input type="text" id="street-brgy" class="form-control" placeholder="Street / Brgy"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Municipality/City</label><br />
                                            <input type="text" id="city" class="form-control" data-name="City" placeholder="Municipality / City"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Province</label><br />
                                            <input type="text" id="province" class="form-control" placeholder="Province"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Zip Code</label><br />
                                            <input type="text" id="zip" class="form-control" placeholder="Zip Code"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Telephone Number</label><br />
                                            <input type="text" id="telephone" class="form-control" placeholder="Telephone Number"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Country of Domicile:</label><br />
                                            <select class="form-control" id="country">
                                                <option value="Afghanistan">Afghanistan</option>
                                                <option value="Åland Islands">Åland Islands</option>
                                                <option value="Albania">Albania</option>
                                                <option value="Algeria">Algeria</option>
                                                <option value="American Samoa">American Samoa</option>
                                                <option value="Andorra">Andorra</option>
                                                <option value="Angola">Angola</option>
                                                <option value="Anguilla">Anguilla</option>
                                                <option value="Antarctica">Antarctica</option>
                                                <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                                <option value="Argentina">Argentina</option>
                                                <option value="Armenia">Armenia</option>
                                                <option value="Aruba">Aruba</option>
                                                <option value="Australia">Australia</option>
                                                <option value="Austria">Austria</option>
                                                <option value="Azerbaijan">Azerbaijan</option>
                                                <option value="Bahamas">Bahamas</option>
                                                <option value="Bahrain">Bahrain</option>
                                                <option value="Bangladesh">Bangladesh</option>
                                                <option value="Barbados">Barbados</option>
                                                <option value="Belarus">Belarus</option>
                                                <option value="Belgium">Belgium</option>
                                                <option value="Belize">Belize</option>
                                                <option value="Benin">Benin</option>
                                                <option value="Bermuda">Bermuda</option>
                                                <option value="Bhutan">Bhutan</option>
                                                <option value="Bolivia, Plurinational State of">Bolivia, Plurinational State of</option>
                                                <option value="Bonaire, Sint Eustatius and Saba">Bonaire, Sint Eustatius and Saba</option>
                                                <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                                <option value="Botswana">Botswana</option>
                                                <option value="Bouvet Island">Bouvet Island</option>
                                                <option value="Brazil">Brazil</option>
                                                <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                                                <option value="Brunei Darussalam">Brunei Darussalam</option>
                                                <option value="Bulgaria">Bulgaria</option>
                                                <option value="Burkina Faso">Burkina Faso</option>
                                                <option value="Burundi">Burundi</option>
                                                <option value="Cambodia">Cambodia</option>
                                                <option value="Cameroon">Cameroon</option>
                                                <option value="Canada">Canada</option>
                                                <option value="Cape Verde">Cape Verde</option>
                                                <option value="Cayman Islands">Cayman Islands</option>
                                                <option value="Central African Republic">Central African Republic</option>
                                                <option value="Chad">Chad</option>
                                                <option value="Chile">Chile</option>
                                                <option value="China">China</option>
                                                <option value="Christmas Island">Christmas Island</option>
                                                <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                                <option value="Colombia">Colombia</option>
                                                <option value="Comoros">Comoros</option>
                                                <option value="Congo">Congo</option>
                                                <option value="Congo, the Democratic Republic of the">Congo, the Democratic Republic of the</option>
                                                <option value="Cook Islands">Cook Islands</option>
                                                <option value="Costa Rica">Costa Rica</option>
                                                <option value="Côte d'Ivoire">Côte d'Ivoire</option>
                                                <option value="Croatia">Croatia</option>
                                                <option value="Cuba">Cuba</option>
                                                <option value="Curaçao">Curaçao</option>
                                                <option value="Cyprus">Cyprus</option>
                                                <option value="Czech Republic">Czech Republic</option>
                                                <option value="Denmark">Denmark</option>
                                                <option value="Djibouti">Djibouti</option>
                                                <option value="Dominica">Dominica</option>
                                                <option value="Dominican Republic">Dominican Republic</option>
                                                <option value="Ecuador">Ecuador</option>
                                                <option value="Egypt">Egypt</option>
                                                <option value="El Salvador">El Salvador</option>
                                                <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                <option value="Eritrea">Eritrea</option>
                                                <option value="Estonia">Estonia</option>
                                                <option value="Ethiopia">Ethiopia</option>
                                                <option value="Falkland Islands (Malvinas">Falkland Islands (Malvinas)</option>
                                                <option value="Faroe Islands">Faroe Islands</option>
                                                <option value="Fiji">Fiji</option>
                                                <option value="Finland">Finland</option>
                                                <option value="France">France</option>
                                                <option value="French Guiana">French Guiana</option>
                                                <option value="French Polynesia">French Polynesia</option>
                                                <option value="French Southern Territories">French Southern Territories</option>
                                                <option value="Gabon">Gabon</option>
                                                <option value="Gambia">Gambia</option>
                                                <option value="Georgia">Georgia</option>
                                                <option value="Germany">Germany</option>
                                                <option value="Ghana">Ghana</option>
                                                <option value="Gibraltar">Gibraltar</option>
                                                <option value="Greece">Greece</option>
                                                <option value="Greenland">Greenland</option>
                                                <option value="Grenada">Grenada</option>
                                                <option value="Guadeloupe">Guadeloupe</option>
                                                <option value="Guam">Guam</option>
                                                <option value="Guatemala">Guatemala</option>
                                                <option value="Guernsey">Guernsey</option>
                                                <option value="Guinea">Guinea</option>
                                                <option value="Guinea-Bissau">Guinea-Bissau</option>
                                                <option value="Guyana">Guyana</option>
                                                <option value="Haiti">Haiti</option>
                                                <option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option>
                                                <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                                                <option value="Honduras">Honduras</option>
                                                <option value="Hong Kong">Hong Kong</option>
                                                <option value="Hungary">Hungary</option>
                                                <option value="Iceland">Iceland</option>
                                                <option value="India">India</option>
                                                <option value="Indonesia">Indonesia</option>
                                                <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                                                <option value="Iraq">Iraq</option>
                                                <option value="Ireland">Ireland</option>
                                                <option value="Isle of Man">Isle of Man</option>
                                                <option value="Israel">Israel</option>
                                                <option value="Italy">Italy</option>
                                                <option value="Jamaica">Jamaica</option>
                                                <option value="Japan">Japan</option>
                                                <option value="Jersey">Jersey</option>
                                                <option value="Jordan">Jordan</option>
                                                <option value="Kazakhstan">Kazakhstan</option>
                                                <option value="Kenya">Kenya</option>
                                                <option value="Kiribati">Kiribati</option>
                                                <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
                                                <option value="Korea, Republic of">Korea, Republic of</option>
                                                <option value="Kuwait">Kuwait</option>
                                                <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                                                <option value="Latvia">Latvia</option>
                                                <option value="Lebanon">Lebanon</option>
                                                <option value="Lesotho">Lesotho</option>
                                                <option value="Liberia">Liberia</option>
                                                <option value="Libya">Libya</option>
                                                <option value="Liechtenstein">Liechtenstein</option>
                                                <option value="Lithuania">Lithuania</option>
                                                <option value="Luxembourg">Luxembourg</option>
                                                <option value="Macao">Macao</option>
                                                <option value="Macedonia, the former Yugoslav Republic of">Macedonia, the former Yugoslav Republic of</option>
                                                <option value="Madagascar">Madagascar</option>
                                                <option value="Malawi">Malawi</option>
                                                <option value="Malaysia">Malaysia</option>
                                                <option value="Maldives">Maldives</option>
                                                <option value="Mali">Mali</option>
                                                <option value="Malta">Malta</option>
                                                <option value="Marshall Islands">Marshall Islands</option>
                                                <option value="Martinique">Martinique</option>
                                                <option value="Mauritania">Mauritania</option>
                                                <option value="Mauritius">Mauritius</option>
                                                <option value="Mayotte">Mayotte</option>
                                                <option value="Mexico">Mexico</option>
                                                <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
                                                <option value="Moldova, Republic of">Moldova, Republic of</option>
                                                <option value="Monaco">Monaco</option>
                                                <option value="Mongolia">Mongolia</option>
                                                <option value="Montenegro">Montenegro</option>
                                                <option value="Montserrat">Montserrat</option>
                                                <option value="Morocco">Morocco</option>
                                                <option value="Mozambique">Mozambique</option>
                                                <option value="Myanmar">Myanmar</option>
                                                <option value="Namibia">Namibia</option>
                                                <option value="Nauru">Nauru</option>
                                                <option value="Nepal">Nepal</option>
                                                <option value="Netherlands">Netherlands</option>
                                                <option value="New Caledonia">New Caledonia</option>
                                                <option value="New Zealand">New Zealand</option>
                                                <option value="Nicaragua">Nicaragua</option>
                                                <option value="Niger">Niger</option>
                                                <option value="Nigeria">Nigeria</option>
                                                <option value="Niue">Niue</option>
                                                <option value="Norfolk Island">Norfolk Island</option>
                                                <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                                <option value="Norway">Norway</option>
                                                <option value="Oman">Oman</option>
                                                <option value="Pakistan">Pakistan</option>
                                                <option value="Palau">Palau</option>
                                                <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                                                <option value="Panama">Panama</option>
                                                <option value="Papua New Guinea">Papua New Guinea</option>
                                                <option value="Paraguay">Paraguay</option>
                                                <option value="Peru">Peru</option>
                                                <option value="Philippines">Philippines</option>
                                                <option value="Pitcairn">Pitcairn</option>
                                                <option value="Poland">Poland</option>
                                                <option value="Portugal">Portugal</option>
                                                <option value="Puerto Rico">Puerto Rico</option>
                                                <option value="Qatar">Qatar</option>
                                                <option value="Réunion">Réunion</option>
                                                <option value="Romania">Romania</option>
                                                <option value="Russian Federation">Russian Federation</option>
                                                <option value="Rwanda">Rwanda</option>
                                                <option value="Saint Barthélemy">Saint Barthélemy</option>
                                                <option value="Saint Helena, Ascension and Tristan da Cunha">Saint Helena, Ascension and Tristan da Cunha</option>
                                                <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                                <option value="Saint Lucia">Saint Lucia</option>
                                                <option value="Saint Martin (French part)">Saint Martin (French part)</option>
                                                <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                                                <option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
                                                <option value="Samoa">Samoa</option>
                                                <option value="San Marino">San Marino</option>
                                                <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                                                <option value="Saudi Arabia">Saudi Arabia</option>
                                                <option value="Senegal">Senegal</option>
                                                <option value="Serbia">Serbia</option>
                                                <option value="Seychelles">Seychelles</option>
                                                <option value="Sierra Leone">Sierra Leone</option>
                                                <option value="Singapore">Singapore</option>
                                                <option value="Sint Maarten (Dutch part)">Sint Maarten (Dutch part)</option>
                                                <option value="Slovakia">Slovakia</option>
                                                <option value="Slovenia">Slovenia</option>
                                                <option value="Solomon Islands">Solomon Islands</option>
                                                <option value="Somalia">Somalia</option>
                                                <option value="South Africa">South Africa</option>
                                                <option value="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</option>
                                                <option value="South Sudan">South Sudan</option>
                                                <option value="Spain">Spain</option>
                                                <option value="Sri Lanka">Sri Lanka</option>
                                                <option value="Sudan">Sudan</option>
                                                <option value="Suriname">Suriname</option>
                                                <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                                                <option value="Swaziland">Swaziland</option>
                                                <option value="Sweden">Sweden</option>
                                                <option value="Switzerland">Switzerland</option>
                                                <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                                                <option value="Taiwan, Province of China">Taiwan, Province of China</option>
                                                <option value="Tajikistan">Tajikistan</option>
                                                <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                                                <option value="Thailand">Thailand</option>
                                                <option value="Timor-Leste">Timor-Leste</option>
                                                <option value="Togo">Togo</option>
                                                <option value="Tokelau">Tokelau</option>
                                                <option value="Tonga">Tonga</option>
                                                <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                <option value="Tunisia">Tunisia</option>
                                                <option value="Turkey">Turkey</option>
                                                <option value="Turkmenistan">Turkmenistan</option>
                                                <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                                <option value="Tuvalu">Tuvalu</option>
                                                <option value="Uganda">Uganda</option>
                                                <option value="Ukraine">Ukraine</option>
                                                <option value="United Arab Emirates">United Arab Emirates</option>
                                                <option value="United Kingdom">United Kingdom</option>
                                                <option value="United States">United States</option>
                                                <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                                                <option value="Uruguay">Uruguay</option>
                                                <option value="Uzbekistan">Uzbekistan</option>
                                                <option value="Vanuatu">Vanuatu</option>
                                                <option value="Venezuela, Bolivarian Republic of">Venezuela, Bolivarian Republic of</option>
                                                <option value="Viet Nam">Viet Nam</option>
                                                <option value="VGB">Virgin Islands, British</option>
                                                <option value="Virgin Islands, British">Virgin Islands, U.S.</option>
                                                <option value="Wallis and Futuna">Wallis and Futuna</option>
                                                <option value="Western Sahara">Western Sahara</option>
                                                <option value="Yemen">Yemen</option>
                                                <option value="Zambia">Zambia</option>
                                                <option value="Zimbabwe">Zimbabwe</option>
                                            </select>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Cellphone Number</label><br />
                                            <input type="text" id="cellphone" class="form-control" placeholder="Cellphone Number"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Birth Date</label><br />
                                            <input type="date" id="birthdate" class="form-control" data-name="Birthday"/>
                                            <label id="error-birthdate" style="display: none" class="text-danger"></label>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Birth Place</label><br />
                                            <input type="text" id="birthplace" class="form-control" placeholder="Birth Place"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Civil Status</label><br />
                                            <select id="civil-status" class="form-control">
                                                <option value="Single">Single</option>
                                                <option value="Married">Married</option>
                                                <option value="Widowed">Widowed</option>
                                                <option value="Separated">Separated</option>
                                            </select>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Sex</label><br />
                                            <select id="sex" class="form-control">
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="text-primary">Height</label><br />

                                             <div class="col-md-6">
                                                <input type="text" id="height" class="form-control" placeholder="Height" />
                                             </div>

                                            <div class="col-md-6">
                                                <select id="height-suffix" class="form-control">
                                                    <option value="cm">cm</option>
                                                    <option value="ft">ft</option>
                                                </select>
                                            </div>

                                        </div>

                                        <div class="col-md-6">
                                            <label class="text-primary">Weight</label><br />

                                             <div class="col-md-6">
                                                <input type="text" id="weight" class="form-control" placeholder="Weight" />
                                             </div>

                                            <div class="col-md-6">
                                                <select id="weight-suffix" class="form-control">
                                                    <option value="kg">kg</option>
                                                    <option value="lbs">lbs</option>
                                                </select>
                                            </div>

                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Blood Type</label><br />
                                            <input type="text" id="blood" class="form-control" placeholder="Blood Type"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Eye Color</label><br />
                                            <input type="text" id="eye-color" class="form-control" placeholder="Eye Color"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Nationality</label><br />
                                            <input type="text" id="nationality" class="form-control" placeholder="Nationality"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Religion</label><br />
                                            <input type="text" id="religion" class="form-control" placeholder="Religion"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Race</label><br />
                                            <input type="text" id="race" class="form-control" placeholder="Race"/>
                                        </div>

                                        <div class="col-md-4">
                                            <label class="text-primary">Foreign Languages</label><br />
                                            <input type="text" id="languages" class="form-control" placeholder="Languages"/>
                                        </div>

                                        <%--kins--%>

                                        <div class="col-md-12">
                                            <h4>
                                                <i>Next of Kin</i>
                                            </h4>
                                        </div>
                                            
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <label class="text-primary">Full Name</label><br />
                                                <input type="text" id="kin-name" class="form-control" placeholder="Fullname" data-name="Name"/>
                                                <label id="error-kin" style="display: none" class="text-danger"></label>
                                            </div>

                                            <div class="col-md-6">
                                                <label class="text-primary">Relationship</label><br />
                                                <input type="text" id="relationship" class="form-control" placeholder="Relationship" data-name="Relationship"/>
                                                <label id="error-relationship" style="display: none" class="text-danger"></label>
                                            </div>

                                            <div class="col-md-4">
                                                <label class="text-primary">Telephone Number</label><br />
                                                <input type="text" id="kin-phone" class="form-control" placeholder="Telephone Number" data-name="Telephone"/>
                                                <label id="error-phone" style="display: none" class="text-danger"></label>
                                            </div>

                                            <div class="col-md-4">
                                                <label class="text-primary">Birth Date</label><br />
                                                <input type="date" id="kin-bday" class="form-control" data-name="Birthday"/>
                                                <label id="error-bday" style="display: none" class="text-danger"></label>
                                            </div>

                                            <div class="col-md-4">
                                                <label class="text-primary">H/P No.</label><br />
                                                <input type="text" id="kin-hp" placeholder="H/P No." class="form-control" data-name="No."/>
                                                <label id="error-hp" style="display: none" class="text-danger"></label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="text-primary">Address</label><br />
                                                <input type="text" id="kin-address" placeholder="Address" class="form-control" data-name="Address"/>
                                                <label id="error-kin-address" style="display: none" class="text-danger"></label>
                                            </div>
                                        </div>

                                        <%--end kin--%>

                                    </div>
                                </div>
                                <div class="box-footer">
                                    <asp:Button runat="server" ID="save_picture" CssClass="hide" Text="Upload" OnClick="save_picture_Click"/>
                                    <button id="save" class="btn btn-primary">Save Applicant
                                        <i class="fa fa-spinner fa-spin hidden"></i>
                                    </button>
                                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </div>
</form>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/applicant.js"></script>
</asp:Content>
