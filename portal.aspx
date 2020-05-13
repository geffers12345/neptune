<%@ Page Title="Crew Portal" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="portal.aspx.cs" Inherits="Seabase.crewportal.portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper">
    <style>
        .applicant-actions .btn {
                margin: 5px 0px;
        }
    </style>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight"></h3>
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

                        </div>
                        <div class="box-footer">
                            <div class="container emp-profile">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="profile-img">
                                            <img src="#" class="img-thumbnail animated bounceIn" id="imageHere" alt=""/>
                                            <br />
                                            <br />
                                            <a role="button" class="form-control" 
                                                data-toggle="modal" data-target="#change-picture-modal" style="width: 70%">Change Picture</a>
                                            <br />

                                            <table>
                                                <tr>
                                                    <td><a href="#" target="_blank" id="travelling">Travel Documents</a></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="profile-head">

                                            <h4 id="name" class="animated bounceIn" style="font-weight: bold"></h4>

                                            <table>
                                                <tr class="crew-only">
                                                    <td>
                                                        <h5>Group</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="group-view" class="text-success"></h5>
                                                    </td>
                                                </tr>
                                                <tr class="crew-only">
                                                    <td>
                                                        <h5>Current Principal</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="principal-view" class="text-success"></h5>
                                                    </td>
                                                </tr>
                                                <tr class="crew-only">
                                                    <td>
                                                        <h5>Current Vessel</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="vessel-view" class="text-success"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Position</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="rank-view"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Email Address</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="email-view"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Contact Number</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="contact-view"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Age</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="age-view"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Status</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="status-view"></h5>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div style="overflow: auto; padding-right: 7%; margin-top: 5%;">
                                        <main>
                                        <input id="tab0" type="radio" name="tabs" checked/>
                                        <label for="tab0" class="tabs lock animated bounceIn">Personal Info</label>

                                        <input id="tab1" type="radio" name="tabs"/>
                                        <label for="tab1" class="tabs animated bounceIn">Family/Beneficiary</label>
    
                                        <input id="tab2" type="radio" name="tabs"/>
                                        <label for="tab2" class="tabs animated bounceIn">Education</label>

                                        <input id="tab3" type="radio" name="tabs"/>
                                        <label for="tab3" class="tabs animated bounceIn">Cert's and Docs</label>

                                        <input id="tab4" type="radio" name="tabs"/>
                                        <label for="tab4" class="tabs animated bounceIn">Medical/Vaccine</label>

                                        <input id="tab5" type="radio" name="tabs" class="crew-only"/>
                                        <label for="tab5" class="tabs animated bounceIn crew-only">Sea Service</label>

                                        <input id="tab6" type="radio" name="tabs"/>
                                        <label for="tab6" class="tabs animated bounceIn">Application History</label>

                                        <input id="tab7" type="radio" name="tabs"/>
                                        <label for="tab7" class="tabs animated bounceIn">Work Experiences</label>

                                        <input id="tab8" type="radio" name="tabs" class="crew-only"/>
                                        <label for="tab8" class="tabs animated bounceIn crew-only">Salary</label>

                                        <section id="content">
                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Personal Information 
                                                    <i class="fa fa-edit" style="color: blue;" id="edit-info">
                                                        <span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>
                                                    </i>
                                                </h3>
                                            </div>
                                            
                                            <div class="form-group" id="personal">

                                                <div class="col-md-4">
                                                    <label class="text-primary">Application Date</label><br />
                                                    <input type="date" id="date" class="form-control" data-name="Date"/>
                                                    <label id="error-date" style="display: none" class="text-danger"></label>
                                                </div>

                                                <div class="col-md-8">
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

                                                <div class="col-md-6">
                                                    <label class="text-primary">Last Name</label><br />
                                                    <input type="text" id="lastname" class="form-control" data-name="Last Name" placeholder="Last Name"/>
                                                    <label id="error-lname" style="display: none" class="text-danger"></label>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="text-primary">First Name</label><br />
                                                    <input type="text" id="firstname" class="form-control" data-name="First Name" placeholder="First Name"/>
                                                    <label id="error-fname" style="display: none" class="text-danger"></label>
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="text-primary">Middle Name</label><br />
                                                    <input type="text" id="middlename" class="form-control" data-name="Middle Name" placeholder="Middle Name"/>
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="text-primary">Email Address</label><br />
                                                    <input type="text" id="email" class="form-control" placeholder="Email"/>
                                                    <label id="error-email" style="display: none" class="text-danger"></label>
                                                </div>

                                                <div class="col-md-4 hidden">
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
                                                    <input type="date" id="birthdate" class="form-control"/>
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
                                                    <input type="text" id="height" class="form-control" placeholder="Height" />
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="text-primary">Weight</label><br />
                                                    <input type="text" id="weight" class="form-control" placeholder="Weight" />
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

                                            </div>

                                            <div class="col-md-12">
                                                <div class="pull-right">
                                                    <button id="save-changes-applicant" class="btn btn-primary">Save Changes
                                                        <i class="fa fa-spinner fa-spin hidden"></i>
                                                    </button>
                                                </div>
                                            </div>

                                            <%--kins--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Next of Kin 
                                                    <i class="fa fa-edit" style="color: blue;" id="edit-kin">
                                                        <span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>
                                                    </i>
                                                </h3>
                                            </div>

                                            <div id="kin">
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

                                                <div class="col-md-12">
                                                    <div class="pull-right">
                                                        <button id="save-changes-kin" class="btn btn-primary">Save Changes
                                                            <i class="fa fa-spinner fa-spin hidden"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                            <%--end kin--%>

                                            <%--uniforms--%>
                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Uniforms
                                                    <i class="fa fa-edit" style="color: blue;" id="edit-uniform">
                                                        <span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>
                                                    </i>
                                                </h3>
                                            </div>
                                            
                                            <div class="form-group" id="uniform">
                                                <div class="col-md-4">
                                                    <label class="text-primary">CoverAll</label><br />
                                                    <input type="text" id="cover-all" class="form-control" placeholder="Cover All" />
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="text-primary">Safety Shoes</label><br />
                                                    <input type="text" id="shoes" class="form-control" placeholder="Safety Shoes"/>
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="text-primary">White Polo</label><br />
                                                    <input type="text" id="polo" class="form-control" placeholder="White Polo"/>
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="text-primary">Black Pants</label><br />
                                                    <input type="text" id="black-pants" class="form-control" placeholder="Black Pants"/>
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="text-primary">Winter Jacket</label><br />
                                                    <input type="text" id="winter-jacket" placeholder="Winter Jacket" class="form-control" />
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="text-primary">Winter Pants</label><br />
                                                    <input type="text" id="winter-pants" placeholder="Winter Pants" class="form-control"/>
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="text-primary">Raincoat</label><br />
                                                    <input type="text" id="raincoat" placeholder="Raincoat" class="form-control"/>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="pull-right">
                                                        <button id="save-changes-uniform" class="btn btn-primary">Save Changes
                                                            <i class="fa fa-spinner fa-spin hidden"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--end uniforms--%>


                                            <%--benefits--%>
                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Government Info
                                                    <i class="fa fa-edit" style="color: blue;" id="edit-benefit">
                                                        <span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>
                                                    </i>
                                                </h3>
                                            </div>
                                            
                                            <div class="form-group" id="benefit">
                                                <div class="col-md-4">
                                                    <label class="text-primary">SSS No.</label><br />
                                                    <input type="text" id="sss" class="form-control" placeholder="SSS No." />
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="text-primary">Philhealth No.</label><br />
                                                    <input type="text" id="philhealth" class="form-control" placeholder="Philhealth No."/>
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="text-primary">Pag-ibig No.</label><br />
                                                    <input type="text" id="pagibig" class="form-control" placeholder="Pag-ibig No."/>
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="text-primary">PSU ID No.</label><br />
                                                    <input type="text" id="psuno" class="form-control" placeholder="PSU ID No."/>
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="text-primary">PSU Issuance Date</label><br />
                                                    <input type="date" id="psudate" class="form-control" />
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="text-primary">NBI No.</label><br />
                                                    <input type="text" id="nbino" placeholder="NBI No." class="form-control"/>
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="text-primary">NBI Validity</label><br />
                                                    <input type="date" id="nbidate" class="form-control"/>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="pull-right">
                                                        <button id="save-changes-benefits" class="btn btn-primary">Save Changes
                                                            <i class="fa fa-spinner fa-spin hidden"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--end benefit--%>

                                            <%--philhealth--%>
                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Philhealth Info
                                                    <i class="fa fa-edit" style="color: blue;" id="edit-phil">
                                                        <span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>
                                                    </i>
                                                </h3>
                                            </div>
                                            
                                            <div class="form-group" id="philhealth-info">
                                                <div class="col-md-12">
                                                    <label class="text-primary">Type of Individually Paying Member:</label><br />
                                                    <input type="text" id="member-type" class="form-control" placeholder="Type of Individually Paying Member:" />
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="text-primary">Monthly Net Income:</label><br />
                                                    <input type="number" min="0" id="net" class="form-control" placeholder="Monthly Net Income:"/>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="text-primary">Member of:</label><br />
                                                    <select id="other-application" class="form-control">
                                                        <option value="">--SELECT MEMBERSHIP--</option>
                                                        <option value="SSS">SSS</option>
                                                        <option value="GSIS">GSIS</option>
                                                        <option value="OWWA">OWWA</option>
                                                        <option value="PNP UNIFORMED">PNP UNIFORMED</option>
                                                    </select>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="text-primary">Character Check/Recommendation/Remarks</label><br />
                                                    <textarea id="character-check" class="form-control" placeholder="Character Check/Recommendation/Remarks"></textarea>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="text-primary">Recommended By</label><br />
                                                    <input type="text" id="recommended-by" placeholder="Recommended By" class="form-control" />
                                                </div>

                                               <div class="col-md-12">
                                                    <label class="text-primary">More Information</label><br />
                                                    <textarea id="more-info" class="form-control" placeholder="More Information"></textarea>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="pull-right">
                                                        <button id="save-changes-philhealth" class="btn btn-primary">Save Changes
                                                            <i class="fa fa-spinner fa-spin hidden"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--end philhealth--%>

                                        </section>

                                        <section id="content1">

                                            <%--family--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Family 
                                                    <i class="fa fa-edit" style="color: blue;" id="edit-family">
                                                        <span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>
                                                    </i>
                                                </h3>
                                            </div>

                                            <div id="family">
                                                <div class="form-group">
                                                    <div class="col-md-6">
                                                        <label class="text-primary">Father's Full Name</label><br />
                                                        <input type="text" id="father" class="form-control" placeholder="Father's Full Name"/>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="text-primary">Father's Occupation</label><br />
                                                        <input type="text" id="father-occupation" class="form-control" placeholder="Father's Occupation"/>
                                                    </div>

                                                    <div class="col-md-7">
                                                        <label class="text-primary">Father's Address</label><br />
                                                        <input type="text" id="father-address" class="form-control" placeholder="Father's Address"/>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <label class="text-primary">Father's Birthday</label><br />
                                                        <input type="date" id="father-bday" class="form-control" />
                                                    </div>

                                                    <div class="col-md-2">
                                                        <label class="text-primary">Age</label><br />
                                                        <input type="text" id="fbday" class="form-control" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="text-primary">Mother's Full Name</label><br />
                                                        <input type="text" id="mother" class="form-control" placeholder="Mother's Full Name"/>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="text-primary">Mother's Occupation</label><br />
                                                        <input type="text" id="mother-occupation" class="form-control" placeholder="Mother's Occupation"/>
                                                    </div>

                                                    <div class="col-md-7">
                                                        <label class="text-primary">Mother's Address</label><br />
                                                        <input type="text" id="mother-address" class="form-control" placeholder="Mother's Address"/>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <label class="text-primary">Mother's Birthday</label><br />
                                                        <input type="date" id="mother-bday" class="form-control"/>
                                                    </div>

                                                    <div class="col-md-2">
                                                        <label class="text-primary">Age</label><br />
                                                        <input type="text" id="mbday" class="form-control" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="text-primary">Spouse Name</label><br />
                                                        <input type="text" id="spouse" class="form-control" placeholder="Spouse Name"/>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="text-primary">Spouse's Occupation</label><br />
                                                        <input type="text" id="spouse-occupation" class="form-control" placeholder="Spouse's Occupation"/>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <label class="text-primary">Spouse Address</label><br />
                                                        <input type="text" id="spouse-address" class="form-control" placeholder="Spouse's Address"/>
                                                    </div>

                                                    <div class="col-md-7">
                                                        <label class="text-primary">Spouse Birth Place</label><br />
                                                        <input type="text" id="spouse-birthplace" class="form-control"/>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <label class="text-primary">Birth Date</label><br />
                                                        <input type="date" id="spouse-bday" class="form-control"/>
                                                    </div>

                                                    <div class="col-md-2">
                                                        <label class="text-primary">Age</label><br />
                                                        <input type="text" id="sbday" class="form-control" />
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="text-primary">Date Married</label><br />
                                                        <input type="date" id="married-date" class="form-control"/>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label class="text-primary">Spouse Philhealth No</label><br />
                                                        <input type="text" id="spouse-phil" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="pull-right">
                                                        <button id="save-changes-family" class="btn btn-primary">Save Changes
                                                            <i class="fa fa-spinner fa-spin hidden"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                            <%--end family--%>

                                            <%--children--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Children</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-child-modal">Add New Child</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="child-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Name</td>
                                                                <td>Sex</td>
                                                                <td>Birth Date</td>
                                                                <td>Age</td>
                                                                <td>Address</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="child-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end children--%>

                                            <%--beneficiary--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Beneficiaries</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-beneficiary-modal">Add New Beneficiary</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="beneficiary-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Name</td>
                                                                <td>Sex</td>
                                                                <td>Birth Date</td>
                                                                <td>Age</td>
                                                                <td>Relationship</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="beneficiary-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end children--%>

                                        </section>
    
                                        <%--start qualification section--%>

                                        <section id="content2">
                                            <%--educ--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Education</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-educ-modal">Add New Education</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="educ-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Course/Degree</td>
                                                                <td>Name of School</td>
                                                                <td>Attendance Date</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="educ-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end educ--%>
                                        </section>

                                        <section id="content3">
                                            <%--licenses--%>

                                            <div class="col-md-12 hidden">
                                                <div class="panel panel-danger"> 
                                                    <div class="panel-heading" style="font-size: x-large;"> 
                                                        <i class="fa fa-bookmark-o"></i> Required Documents
                                                    </div> 
                                                    <div class="panel-body">
                                                        <ol class="list-group" id="required">
                                                          
                                                        </ol>
                                                    </div> 
                                                </div>
                                            </div>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Licenses</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-license-modal">Add New License</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="license-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Type</td>
                                                                <td>License Number</td>
                                                                <td>Issue Date</td>
                                                                <td>Expiry Date</td>
                                                                <td>File</td>
                                                                <td>Issued By</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="license-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end licenses--%>


                                            <%--flags--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Flags</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-flag-modal">Add New Flag</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="flag-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Flag Type</td>
                                                                <td>License</td>
                                                                <td>Document Number</td>
                                                                <td>Rank</td>
                                                                <td>Issue Date</td>
                                                                <td>Expiry Date</td>
                                                                <td>File</td>
                                                                <td>Issued By</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="flag-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end flags--%>


                                            <%--travels--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Travel Documents</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-travel-modal">Add New Document</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="travel-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Document</td>
                                                                <td>Document Number</td>
                                                                <td>Issue Date</td>
                                                                <td>Expiry Date</td>
                                                                <td>Place Issued</td>
                                                                <td>File</td>
                                                                <td>Issued By</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="travel-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end travel--%>

                                            <%--certifiicates--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Trainings & Other Certificates</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-cert-modal">Add New Certificate</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="cert-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Course</td>
                                                                <td>Certificate Number</td>
                                                                <td>Issue Date</td>
                                                                <td>Expiry Date</td>
                                                                <td>Institution</td>
                                                                <td>Place</td>
                                                                <td>STWC Code</td>
                                                                <td>MLC</td>
                                                                <td>File</td>
                                                                <td>Issued By</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="cert-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end certificates--%>

                                            <%--libraries--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Document Library</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-library-modal">Add New Document Library</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="library-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Document Name / Type</td>
                                                                <td>File</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="library-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end libraries--%>
                                        </section>

                                        <section id="content4">
                                            <%--medicals--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Medical</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-med-modal">Add New Medical Certificate</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="med-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Certificate</td>
                                                                <td>Number</td>
                                                                <td>Issue Date</td>
                                                                <td>Expiry Date</td>
                                                                <td>Clinic</td>
                                                                <td>Remarks</td>
                                                                <td>File</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="med-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end medicals--%>

                                            <%--vaccines--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Vaccines</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-vaccine-modal">Add New Vaccine</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="vaccine-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Vaccine</td>
                                                                <td>Immunization Date</td>
                                                                <%--<td>Expiry Date</td>--%>
                                                                <td>File</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="vaccine-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end vaccines--%>
                                        </section>

                                        <section id="content5">
                                            <%--vaccines--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Sea Services</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-work-modal">Add New Service</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="work-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Rank</td>
                                                                <td>Vessel Name</td>
                                                                <td>Vessel Type</td>
                                                                <td>Start Date</td>
                                                                <td>End Date</td>
                                                                <td>Agency</td>
                                                                <td>Months</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="work-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end work--%>
                                        </section>

                                        <section id="content6">
                                            <%--history--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Application History</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="app-history-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Date</td>
                                                                <td>Event</td>
                                                                <td>Author</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="app-history-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end history--%>
                                        </section>

                                        <section id="content7">
                                            <%--experiences--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Work Experiences</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#add-exp-modal">Add New Work</button>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="exp-table" style="width: 100%;">
                                                        <thead>
                                                            <tr>
                                                                <td>Rank</td>
                                                                <td>Vessel Name</td>
                                                                <td>Vessel Type</td>
                                                                <td>Start Date</td>
                                                                <td>End Date</td>
                                                                <td>Agency</td>
                                                                <td>Reason of Leave</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="exp-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <%--end work--%>
                                        </section>

                                        <section id="content8">
                                            <%--salary--%>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Allotee</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal"
                                                    data-target="#add-allotee-modal">Add New Allotee</button>
                                                <div class="pull-right">
                                                    <strong>[<a href="#" target="_blank" 
                                                        id="allotee-report">Allotee Report</a>]</strong>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="allotee-table">
                                                        <thead>
                                                            <tr>
                                                                <td>Allotee Name</td>
                                                                <td>Relationship</td>
                                                                <td>Bank Name</td>
                                                                <td>Account No.</td>
                                                                <td>Address</td>
                                                                <td>Bank Branch</td>
                                                                <td>Allotment</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="allotee-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-md-12 section-header">
                                                <h3 class="animated slideInRight">Salary</h3>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="pull-right">
                                                    <strong>[<a href="#" target="_blank" 
                                                        id="all-salaries">View All Salaries</a>]</strong>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table id="salary-table">
                                                        <thead>
                                                            <tr>
                                                                <td>Rank/Position</td>
                                                                <td>Income Description</td>
                                                                <td>Monthly (USD)</td>
                                                                <td>Daily (USD)</td>
                                                                <td>Percentage</td>
                                                                <td>Days</td>
                                                                <td>Remarks</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="salary-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td style="text-align: left !important;">Total Pay</td>
                                                            <td id="_total-pay" style="text-align: right !important;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left !important;">Allotment</td>
                                                            <td id="_allotment" style="text-align: right !important;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left !important;">Pay On Board</td>
                                                            <td id="_pay" style="text-align: right !important;"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <%--end salary--%>
                                        </section>

                                    </main>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

 <div class="modal fade" id="add-child-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Child</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Full Name:</label><br />
                            <input id="child-name" placeholder="Firstname Middlename Lastname" type="text" class="form-control" data-name="Name"/>
                            <label id="error-child-name" style="display: none" class="text-danger"></label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Address:</label><br />
                            <textarea id="child-address" placeholder="Address" class="form-control" data-name="Address"></textarea>
                            <label id="error-child-address" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Birth Date:</label><br />
                            <input type="date" id="child-bday" class="form-control" data-name="Birthday"/>
                            <label id="error-child-bday" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Sex:</label><br />
                            <select id="child-gender" class="form-control" >
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="save-child" class="btn btn-primary">Save Child
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add-beneficiary-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Beneficiary</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Full Name:</label><br />
                            <input id="bfcry-name" placeholder="Firstname Middlename Lastname" type="text" class="form-control" data-name="Name"/>
                            <label id="error-bfcry-name" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Relationship:</label><br />
                            <input id="bfcry-relation" placeholder="Relationship" type="text" class="form-control" data-name="Relationship"/>
                            <label id="error-bfcry-relation" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Contact Number:</label><br />
                            <input id="bfcry-contact" placeholder="Contact Number" type="text" class="form-control" data-name="Contact Number"/>
                            <label id="error-bfcry-contact" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Address:</label><br />
                            <textarea id="bfcry-address" placeholder="Address" class="form-control" data-name="Address"></textarea>
                            <label id="error-bfcry-address" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Birth Date:</label><br />
                            <input type="date" id="bfcry-bday" class="form-control" data-name="Birthday"/>
                            <label id="error-bfcry-bday" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Birth Place:</label><br />
                            <input type="text" id="bfcry-bplace" class="form-control" placeholder="Birth Place" data-name="Birth Place"/>
                            <label id="error-bfcry-bplace" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Sex:</label><br />
                            <select id="btcry-gender" class="form-control" >
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <input type="checkbox" id="dependent"/>
                            <label for="dependent">Check if Legal Dependent (Mga tatanggap ng benepisyo mula sa Philhealth)</label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="save-bfcry" class="btn btn-primary">Save Beneficiary
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add-educ-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Education</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Course/Degree/Diploma:</label><br />
                            <input id="course" placeholder="Course/Degree/Diploma" type="text" class="form-control" data-name="Course"/>
                            <label id="error-course" style="display: none" class="text-danger"></label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Name of School:</label><br />
                            <input type="text" id="school" placeholder="Name of School" class="form-control" data-name="School" />
                            <label id="error-school" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Attendance Date (Year):</label><br />
                            <input type="number" min="0" id="attendance" class="form-control" data-name="Attendance Date"/>
                            <label id="error-attendance" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="save-educ" class="btn btn-primary">Save Education
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<%--work modal--%>
<div class="modal fade" id="add-work-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Work</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Rank:</label><br />
                            <select id="work-rank" class="form-control">

                            </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Vessel Name:</label><br />
                            <input type="text" id="work-vessel" placeholder="Vessel Name" class="form-control" data-name="Vessel Name" />
                            <label id="error-work-vessel" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                     <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Vessel Type:</label><br />
                            <select id="work-vessel-type" class="form-control">

                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Start Date:</label><br />
                            <input type="date" id="work-start" class="form-control" data-name="Start Date"/>
                            <label id="error-work-start" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">End Date:</label><br />
                            <input type="date" id="work-end" class="form-control" data-name="End Date"/>
                            <label id="error-work-End" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Manning Agency</label><br />
                            <input type="text" id="work-manning" class="form-control" placeholder="Agency" />
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="save-work" class="btn btn-primary">Save Work
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>
<%--end work modal--%>


<%--approve modal--%>

<div class="modal fade" id="add-approve-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Hire Crew</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Select Principal:</label><br />
                            <select id="hire-principal" class="form-control">
                                <option value="">--SELECT PRINCIPAL--</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Select Vessel:</label><br />
                            <select id="vessel" class="form-control">

                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Group:</label><br />
                            <select id="group" class="form-control">
                                <option value="1">Group 1</option>
                                <option value="2">Group 2</option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="accept-crew" class="btn btn-primary">Hire
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<%--end approve modal--%>

<div class="modal fade" id="change-principal-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Update Principal</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Select Principal:</label><br />
                            <select id="change-principal" class="form-control">
                                <option value="">--SELECT PRINCIPAL--</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Select Vessel:</label><br />
                            <select id="change-vessel" class="form-control">

                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Group:</label><br />
                            <select id="group-edit" class="form-control">
                                <option value="1">Group 1</option>
                                <option value="2">Group 2</option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="change-principal-vessel" class="btn btn-primary">Update
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<%--end approve modal--%>

<%--change status modal--%>

<div class="modal fade" id="change-status-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Change Status</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Status:</label><br />
                            <select id="crew-new-status" class="form-control">
                                <option value="9">Operation</option>
                                <option value="8">Pool</option>
                                <option value="6">Reject</option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="change-crew-status" class="btn btn-primary">Update Status
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<%--end approve modal--%>


<%--send to principal--%>

<div class="modal fade" id="add-send-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Send Crew</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Principal:</label><br />
                            <select id="principal" class="form-control">

                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Remarks:</label><br />
                            <textarea id="principal-remarks" class="form-control">

                            </textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="send-crew" class="btn btn-primary">Send to Pricipal
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>


<form runat="server">
    <%--license modal--%>
    <div class="modal fade" id="add-license-modal" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New License</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">License Type:</label><br />
                                <select id="license" class="form-control" data-name="License">

                                </select>
                                <label id="error-license" style="display: none" class="text-danger"></label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">License Number:</label><br />
                                <input type="text" id="license-number" placeholder="License Number" class="form-control" data-name="Number" />
                                <label id="error-license-number" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Rank:</label><br />
                                <select id="license-rank" class="form-control" data-name="Rank">

                                </select>
                                <label id="error-license-rank" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Issue Date:</label><br />
                                <input type="date" id="license-issue" class="form-control" data-name="Issue Date"/>
                                <label id="error-license-issue" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Expiry Date:</label><br />
                                <input type="date" id="license-expiry" class="form-control" data-name="Expiry Date"/>
                                <label id="error-license-expiry" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Issued By:</label><br />
                                <input type="text" id="license-issuedby" placeholder="Issued By" class="form-control" data-name="Issued By"/>
                                <label id="error-license-issued" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Remarks:</label><br />
                                <input type="text" id="license-remarks" placeholder="Issued By" class="form-control" data-name="Remarks"/>
                                <label id="error-license-remarks" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">File Attachments:</label><br />
                                <asp:FileUpload runat="server" ID="LicenseFile" class="form-control" data-name="File"/>
                                <label id="error-license-file" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="save_license" runat="server" CssClass="hidden" Text="Save File" OnClick="save_license_Click"/>
                    <button id="save-license" class="btn btn-primary">Save License
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <%--end license modal--%>

    <%--flag modal--%>
    <div class="modal fade" id="add-flag-modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Document</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Flag Type:</label><br />
                                <select id="flag" class="form-control" data-name="Flag">

                                </select>
                                <label id="error-flag" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">License Type:</label><br />
                                <select id="flag-license" class="form-control" data-name="License">

                                </select>
                                <label id="error-flag-license" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Document Number:</label><br />
                                <input type="text" id="flag-doc-number" placeholder="Document Number" class="form-control" data-name="Number" />
                                <label id="error-flag-doc-number" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Rank:</label><br />
                                <select id="flag-rank" class="form-control" data-name="Rank">

                                </select>
                                <label id="error-flag-rank" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Issue Date:</label><br />
                                <input type="date" id="flag-issue" class="form-control" data-name="Issue Date"/>
                                <label id="error-flag-issue" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Expiry Date:</label><br />
                                <input type="date" id="flag-expiry" class="form-control" data-name="Expiry Date"/>
                                <label id="error-flag-expiry" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Issued By:</label><br />
                                <input type="text" id="flag-issuedby" placeholder="Issued By" class="form-control" data-name="Issued By"/>
                                <label id="error-flag-issued" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Remarks:</label><br />
                                <input type="text" id="flag-remarks" placeholder="Issued By" class="form-control" data-name="Remarks"/>
                                <label id="error-flag-remarks" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">File Attachments:</label><br />
                                <asp:FileUpload runat="server" ID="FlagFile" class="form-control" data-name="File"/>
                                <label id="error-flag-file" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <asp:Button ID="save_flag" runat="server" CssClass="hidden" Text="Save File" OnClick="save_flag_Click"/>
                        <button id="save-flag" class="btn btn-primary">Save Flag
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--end flag modal--%>


    <%--travel modal--%>
    <div class="modal fade" id="add-travel-modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Travel Document</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Document Type:</label><br />
                                <select id="document" class="form-control" data-name="Document">

                                </select>
                                <label id="error-document" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Document Number:</label><br />
                                <input type="text" id="cert-number" placeholder="Document Number" class="form-control" data-name="Number" />
                                <label id="error-cert-number" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Issue Date:</label><br />
                                <input type="date" id="cert-issue" class="form-control" data-name="Issue Date"/>
                                <label id="error-cert-issue" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Expiry Date:</label><br />
                                <input type="date" id="cert-expiry" class="form-control" data-name="Expiry Date"/>
                                <label id="error-cert-expiry" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Issued By:</label><br />
                                <input type="text" id="cert-issuedby" placeholder="Issued By" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Place Issued:</label><br />
                                <input type="text" id="cert-place" placeholder="Issued By" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">File Attachments:</label><br />
                                <asp:FileUpload runat="server" ID="TravelFile" class="form-control" data-name="File"/>
                                <label id="error-travel-file" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <asp:Button ID="save_travel" runat="server" CssClass="hidden" Text="Save File" OnClick="save_travel_Click"/>
                        <button id="save-travel" class="btn btn-primary">Save
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="edit-travel-modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Modify Travel Document</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Document Type:</label><br />
                                <select id="document-edit" class="form-control" data-name="Document" disabled>

                                </select>
                                <label id="error-document-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Document Number:</label><br />
                                <input type="text" id="cert-number-edit" placeholder="Document Number" class="form-control" data-name="Number" />
                                <label id="error-cert-number-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Issue Date:</label><br />
                                <input type="date" id="cert-issue-edit" class="form-control" data-name="Issue Date"/>
                                <label id="error-cert-issue-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Expiry Date:</label><br />
                                <input type="date" id="cert-expiry-edit" class="form-control" data-name="Expiry Date"/>
                                <label id="error-cert-expiry-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Issued By:</label><br />
                                <input type="text" id="cert-issuedby-edit" placeholder="Issued By" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Place Issued:</label><br />
                                <input type="text" id="cert-place-edit" placeholder="Issued By" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">File Attachments:</label><br />
                                <asp:FileUpload runat="server" ID="TravelFileEdit" class="form-control" data-name="File"/>
                                <label id="error-travel-file-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <asp:Button ID="save_travel_edit" runat="server" CssClass="hidden" Text="Save File" OnClick="save_travel_edit_Click"/>
                        <button id="save-travel-edit" class="btn btn-primary">Save
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--end travel modal--%>


    <%--certificate modal--%>
    <div class="modal fade" id="add-cert-modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Certificate</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Course / Trainings:</label><br />
                                <select id="training-course" class="form-control" data-name="Course">

                                </select>
                                <label id="error-training" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Institution / Training Centers:</label><br />
                                <select id="center" class="form-control" data-name="Course">

                                </select>
                                <label id="error-center" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Use for MLC Contract:</label><br />
                                <input type="checkbox" id="mlc"/>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Certificate Number:</label><br />
                                <input type="text" id="training-number" placeholder="Number" class="form-control" data-name="Number"/>
                                <label id="error-training-number" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Issue Date:</label><br />
                                <input type="date" id="training-issue" class="form-control" data-name="Issue Date"/>
                                <label id="error-training-issue" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Expiry Date:</label><br />
                                <input type="date" id="training-expiry" class="form-control" data-name="Expiry Date"/>
                                <label id="error-training-expiry" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Place Issued:</label><br />
                                <input type="text" id="training-place" placeholder="Place Issued" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Issued By:</label><br />
                                <input type="text" id="training-issuedby" placeholder="Issued By" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">File Attachments:</label><br />
                                <asp:FileUpload runat="server" ID="TrainingFile" class="form-control" data-name="File"/>
                                <label id="error-training-file" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">STCW Code:</label><br />
                                <input type="text" id="training-code" placeholder="STCW Code" class="form-control"/>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <asp:Button ID="save_training" runat="server" CssClass="hidden" Text="Save File" OnClick="save_training_Click"/>
                        <button id="save-training" class="btn btn-primary">Save
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="edit-cert-modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Modify Training Certificate</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Course / Trainings:</label><br />
                                <select id="training-course-edit" class="form-control" data-name="Course">

                                </select>
                                <label id="error-training-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Institution / Training Centers:</label><br />
                                <select id="center-edit" class="form-control" data-name="Course">

                                </select>
                                <label id="error-center-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Use for MLC Contract:</label><br />
                                <input type="checkbox" id="mlc-edit"/>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Certificate Number:</label><br />
                                <input type="text" id="training-number-edit" placeholder="Number" class="form-control" data-name="Number"/>
                                <label id="error-training-number-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Issue Date:</label><br />
                                <input type="date" id="training-issue-edit" class="form-control" data-name="Issue Date"/>
                                <label id="error-training-issue-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Expiry Date:</label><br />
                                <input type="date" id="training-expiry-edit" class="form-control" data-name="Expiry Date"/>
                                <label id="error-training-expiry-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Place Issued:</label><br />
                                <input type="text" id="training-place-edit" placeholder="Place Issued" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Issued By:</label><br />
                                <input type="text" id="training-issuedby-edit" placeholder="Issued By" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">File Attachments:</label><br />
                                <asp:FileUpload runat="server" ID="TrainingFileEdit" class="form-control" data-name="File"/>
                                <label id="error-training-file-edit" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">STCW Code:</label><br />
                                <input type="text" id="training-code-edit" placeholder="STCW Code" class="form-control"/>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <asp:Button ID="save_training_edit" runat="server" CssClass="hidden" Text="Save File" OnClick="save_training_edit_Click"/>
                        <button id="save-training-changes" class="btn btn-primary">Save
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--end certificate modal--%>

    <%--certificate modal--%>
    <div class="modal fade" id="add-library-modal" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Document</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Document Name / Type:</label><br />
                                <input type="text" id="library" class="form-control" placeholder="Document Name" data-name="Library" />
                                <label id="error-library" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">File Attachments:</label><br />
                                <asp:FileUpload runat="server" ID="LibraryFile" class="form-control" data-name="File"/>
                                <label id="error-library-file" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <asp:Button ID="save_library" runat="server" CssClass="hidden" Text="Save File" OnClick="save_library_Click"/>
                        <button id="save-library" class="btn btn-primary">Save
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--end library modal--%>

    <%--medicals modal--%>
    <div class="modal fade" id="add-med-modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Medical Certificate</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Medical Certificate:</label><br />
                                <select id="medical" class="form-control" data-name="Medical">

                                </select>
                                <label id="error-medical" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Clinic:</label><br />
                                <select id="clinic" class="form-control" data-name="Clinic">

                                </select>
                                <label id="error-clinic" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Certificate Number:</label><br />
                                <input type="text" id="med-number" placeholder="Number" class="form-control" data-name="Number"/>
                                <label id="error-med-number" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Issue Date:</label><br />
                                <input type="date" id="med-issue" class="form-control" data-name="Issue Date"/>
                                <label id="error-med-issue" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">Expiry Date:</label><br />
                                <input type="date" id="med-expiry" class="form-control" data-name="Expiry Date"/>
                                <label id="error-med-expiry" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-primary">File Attachments:</label><br />
                                <asp:FileUpload runat="server" ID="MedFile" class="form-control" data-name="File"/>
                                <label id="error-med-file" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Remarks:</label><br />
                                <input type="text" id="med-remarks" placeholder="Remarks" class="form-control"/>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <asp:Button ID="save_med" runat="server" CssClass="hidden" Text="Save File" OnClick="save_med_Click"/>
                        <button id="save-med" class="btn btn-primary">Save
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--end medicals modal--%>

    <%--vaccines modal--%>
    <div class="modal fade" id="add-vaccine-modal" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Vaccine</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Vaccine:</label><br />
                                <select id="vaccine" class="form-control" data-name="Medical">

                                </select>
                                <label id="error-vaccine" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Immunization Date:</label><br />
                                <input type="date" id="vaccine-issue" class="form-control" data-name="Issue Date"/>
                                <label id="error-vaccine-issue" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-6 hidden">
                            <div class="form-group">
                                <label class="text-primary">Expiry Date:</label><br />
                                <input type="date" id="vaccine-expiry" class="form-control" data-name="Expiry Date"/>
                                <label id="error-vaccine-expiry" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">File Attachments:</label><br />
                                <asp:FileUpload runat="server" ID="VaccineFile" class="form-control" data-name="File"/>
                                <label id="error-vaccine-file" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-md-12">
                        <asp:Button ID="save_vaccine" runat="server" CssClass="hidden" Text="Save File" OnClick="save_vaccine_Click"/>
                        <button id="save-vaccine" class="btn btn-primary">Save
                            <i class="fa fa-spinner fa-spin hidden"></i>
                        </button>
                        <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--end vaccines modal--%>

    <%--work modal--%>
    <div class="modal fade" id="add-eval-modal" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Add New Evaluation</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Vessel:</label><br />
                                <select id="eval-vessel" class="form-control" data-name="Vessel"></select>
                                <label id="error-eval-vessel" style="display: none" class="text-danger"></label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Rank:</label><br />
                                <select id="eval-rank" class="form-control" data-name="Rank">

                                </select>
                                <label id="error-eval-rank" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Grade:</label><br />
                                <select id="eval-grade" class="form-control">
                                    <option value="Excellent">Excellent</option>
                                    <option value="Good">Good</option>
                                    <option value="Poor">Poor</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Evaluation:</label><br />
                                <select id="eval-evaluation" class="form-control">
                                    <option value="Excellent">Excellent</option>
                                    <option value="Good">Good</option>
                                    <option value="Poor">Poor</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Document Name/Type:</label><br />
                                <input type="text" id="eval-document" class="form-control" placeholder="Document"/>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">File Attachment:</label><br />
                                <asp:FileUpload runat="server" ID="eval_file" class="form-control" data-name="File"/>
                            </div>
                        </div>

                         <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Remarks:</label><br />
                                <textarea id="eval-remarks" class="form-control" placeholder="Type remarks here"></textarea>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Assessed By:</label><br />
                                <input type="text" id="eval-assess" class="form-control" placeholder="Assessed By" />
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="saveEvaluationFile" runat="server" CssClass="hidden" Text="Save File" OnClick="saveEvaluationFile_Click"/>
                    <button id="save-eval" class="btn btn-primary">Save Evaluation
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <%--end evaluation modal--%>

    <div class="modal fade" id="change-picture-modal" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-primary">
                        <span class="fa fa-plus-circle"></span> &nbsp;
                        Update Picture</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Image:</label><br />
                                <asp:FileUpload runat="server" ID="crewPicture" class="form-control" data-name="File"/>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="saveCrewImage" CssClass="btn btn-primary" Text="Save Changes" OnClick="saveCrewImage_Click"/>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</form>

<%--senders modal--%>

<div class="modal fade" id="send-email-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Send Email</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">To:</label><br />
                            <input type="text" class="form-control" id="receiver" disabled/>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Sender:</label><br />
                            <input type="text" class="form-control" id="sender" disabled/>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Subject:</label><br />
                            <input type="text" class="form-control" placeholder="Subject" id="subject"/>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Message:</label><br />
                            <textarea class="form-control" id="email-content" placeholder="Type your message here.." rows="10"></textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="send-email" class="btn btn-primary">Send Email
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="send-text-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Send Text Message</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">To:</label><br />
                            <input type="text" class="form-control" id="receiver-number" disabled/>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Message:</label><br />
                            <textarea class="form-control" id="text-content" placeholder="Type your message here.." rows="10"></textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="send-text" class="btn btn-primary">Send Message
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<%--end senders modal--%>

<%--work modal--%>
<div class="modal fade" id="add-exp-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Work Experience</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Rank:</label><br />
                            <input type="text" id="exp-rank" class="form-control" data-name="Rank" />
                            <label id="error-exp-rank" style="display: none" class="text-danger"></label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Vessel Name:</label><br />
                            <input type="text" id="exp-vessel" placeholder="Vessel Name" class="form-control" data-name="Vessel Name" />
                            <label id="error-exp-vessel" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                     <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Vessel Type:</label><br />
                            <input id="exp-vessel-type" class="form-control" />
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Start Date:</label><br />
                            <input type="date" id="exp-start" class="form-control" data-name="Start Date"/>
                            <label id="error-exp-start" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">End Date:</label><br />
                            <input type="date" id="exp-end" class="form-control" data-name="End Date"/>
                            <label id="error-exp-End" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Manning Agency</label><br />
                            <input type="text" id="exp-manning" class="form-control" placeholder="Agency" />
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Reason of Leave</label><br />
                            <textarea id="exp-reason" class="form-control"></textarea>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="save-exp" class="btn btn-primary">Save Work Experience
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>
<%--end work modal--%>

<%--ontraining modal--%>

<div class="modal fade" id="ontraining-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Training Info</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Seminars and Trainings:</label><br />
                            <select id="seminars" class="form-control" data-name="Training">
                                <option value="">--SELECT TRAINING OR SEMINARS--</option>
                            </select>
                            <label id="error-train-seminar" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Training Centers:</label><br />
                            <select id="centers" class="form-control" data-name="Center">
                                <option value="">--SELECT TRAINING CENTERS--</option>
                            </select>
                            <label id="error-train-center" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Remarks:</label><br />
                            <textarea id="training-remarks" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">Start Date:</label><br />
                            <input type="date" id="training-start" class="form-control" data-name="Start Date" />
                            <label id="error-train-start" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="text-primary">End Date:</label><br />
                            <input type="date" id="training-end" class="form-control" data-name="End" />
                            <label id="error-train-end" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="training" class="btn btn-primary">Save Training
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<%--ontraining modal--%>

<div class="modal fade" id="others-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Crew Salary</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table id="table-salary">
                        <thead>
                            <tr>
                                <td>Rank/Position</td>
                                <td>Income Description</td>
                                <td>Monthly (USD)</td>
                                <td>Daily (USD)</td>
                                <td>Percentage</td>
                                <td>Days</td>
                                <td>Remarks</td>
                            </tr>
                        </thead>
                        <tbody id="rank-tbody">

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <%--<button id="save-others" class="btn btn-primary">Save Changes
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>--%>
                <button data-dismiss="modal" class="btn btn-danger">Close</button>
            </div>
        </div>
    </div>
</div>

<%--allotee modal--%>
<div class="modal fade" id="add-allotee-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Allotee</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Account Name:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee" type="text" class="form-control" placeholder="Allotee Name" data-name="Allotee Name"/>
                            </div>
                            <label id="error-allotee" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Relationship:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-relationship" type="text" class="form-control" placeholder="Relationship" data-name="Relationship"/>
                            </div>
                            <label id="error-relationship" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Bank Name:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-bank" type="text" class="form-control" placeholder="Bank Name" data-name="Bank Name"/>
                            </div>
                            <label id="error-bank" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Account Number:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-account" type="text" class="form-control" placeholder="Account No." data-name="Account No."/>
                            </div>
                            <label id="error-account" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Address:</label><br />
                            <textarea id="allotee-account-name" class="form-control" placeholder="Address" data-name="Address"></textarea>
                            <label id="error-account-name" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Bank Branch:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-branch" type="text" class="form-control" placeholder="Bank Branch"/>
                            </div>
                            <label id="error-branch" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Allotment Amount:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-percentage" type="number" class="form-control" data-name="Percentage"/>
                            </div>
                            <label id="error-percentage" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="save-allotee" class="btn btn-primary">Save Allotee
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="update-allotee-modal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Update Allotee</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Account Name:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-edit" type="text" class="form-control" placeholder="Allotee Name" data-name="Allotee Name"/>
                            </div>
                            <label id="error-allotee-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Relationship:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-relationship-edit" type="text" class="form-control" placeholder="Relationship" data-name="Relationship"/>
                            </div>
                            <label id="error-relationship-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Bank Name:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-bank-edit" type="text" class="form-control" placeholder="Bank Name" data-name="Bank Name"/>
                            </div>
                            <label id="error-bank-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Account Number:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-account-edit" type="text" class="form-control" placeholder="Account No." data-name="Account No."/>
                            </div>
                            <label id="error-account-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Address:</label><br />
                            <textarea id="allotee-account-name-edit" class="form-control" placeholder="Address" data-name="Address"></textarea>
                            <label id="error-account-name-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Bank Branch:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-branch-edit" type="text" class="form-control" placeholder="Bank Branch"/>
                            </div>
                            <label id="error-branch-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Allotment Amount:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="allotee-percentage-edit" type="number" class="form-control" data-name="Percentage"/>
                            </div>
                            <label id="error-percentage-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="save-changes-allotee" class="btn btn-primary">Save Changes
                    <i class="fa fa-spinner fa-spin hidden"></i>
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>

<select class="form-control" id="scales" style="display: none; opacity: 0;" disabled></select>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/maintenance.js"></script>
<script src="scripts/WebForms/applicant.js"></script>
<script>
    var applicantID = 0;

    $(document).ready(function () {
        var url = new URL(window.location.href);
        applicantID = url.searchParams.get("_hsdlwhx");

        applicant(applicantID);

        $('#travelling').attr('href', '/reporting?_hsdlwhx=' + applicantID);
        $('#allotee-report').attr('href', '/report-allotee?_hsdlwhx=' + applicantID);
        $('#all-salaries').attr('href', '/all-salaries?_hsdlwhx=' + applicantID);
    });
</script>
</asp:Content>
