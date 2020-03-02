<%@ Page Title="Vessel Information" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="vessel.aspx.cs" Inherits="Seabase.vessel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form runat="server">
    <div class="content-wrapper div-vessel">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title animated slideInRight">Vessel Information</h3>
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
                                            <img src="content/img/cruise-ship.jpg" class="animated bounceIn" id="imageHere" alt=""/>
                                            <br />
                                            
                                                <input type="text" id="ID" runat="server" style="display: none" />
                                                <label>Upload Picture</label>
                                                <asp:FileUpload runat="server" id="file" CssClass="form-control" />
                                                <br />
                                                <asp:Button runat="server" ID="saveImage" CssClass="btn btn-primary" Text="Upload Logo" OnClick="saveImage_Click"/>
                                            
                                            <br />
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="profile-head">

                                            <h4 id="name-view" class="animated bounceIn" style="font-weight: bold"></h4>

                                            <table>
                                                <tr>
                                                    <td>
                                                        <h5>Call Sign</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="sign-view"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Code</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="code-view"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Vessel Type</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="type-view"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Principal</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="principal-view"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Contact Person</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="person-view"></h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h5>Manager</h5>
                                                    </td>
                                                    <td>
                                                        <h5 id="manager-view"></h5>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <main>
                                        <input id="tab0" type="radio" name="tabs" checked/>
                                        <label for="tab0" class="tabs lock animated bounceIn">Vessel Info</label>

                                        <input id="tab1" type="radio" name="tabs"/>
                                        <label for="tab1" class="tabs animated bounceIn">Technical Specs</label>
    
                                        <input id="tab2" type="radio" name="tabs"/>
                                        <label for="tab2" class="tabs animated bounceIn">Ranks</label>

                                        <input id="tab3" type="radio" name="tabs"/>
                                        <label for="tab3" class="tabs animated bounceIn">Docs and Certificates</label>

                                        <input id="tab4" type="radio" name="tabs"/>
                                        <label for="tab4" class="tabs animated bounceIn">Document Library</label>

                                        <section id="content">
                                            <div class="col-md-12">
                                                <h3 class="animated slideInRight">Basic Information 
                                                    <i class="fa fa-edit" style="color: blue;" id="edit-info">
                                                        <span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>
                                                    </i>
                                                </h3>
                                            </div>
                                            
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="text-primary">Vessel Name:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input id="name" placeholder="Name" type="text" class="form-control" data-name="Name"/>
                                                    </div>
                                                    <label id="error-name" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Call Sign:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="sign" class="form-control" data-name="Call Sign" placeholder="Call Sign"/>
                                                    </div>
                                                    <label id="error-sign" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Code:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="code" class="form-control" data-name="Code" placeholder="Code"/>
                                                    </div>
                                                    <label id="error-code" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Vessel Type:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <select id="type" class="form-control" data-name="Type">
                                                            <option value="">--SELECT TYPE--</option>
                                                        </select>
                                                    </div>
                                                    <label id="error-type" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Principal:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <select id="principal" class="form-control" data-name="Principal">
                                                            <option value="">--SELECT PRINCIPAL--</option>
                                                        </select>
                                                    </div>
                                                    <label id="error-principal" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Current Location:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <select class="form-control" id="current" data-name="Country">
                                                            <option value="">--SELECT COUNTRY--</option>
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
                                                    <label id="error-current" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Next Destination:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <select class="form-control" id="destination" data-name="Country">
                                                            <option value="">--SELECT COUNTRY--</option>
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
                                                    <label id="error-destination" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Enrolled With:</label><br />
                                                    <select id="enrolled" class="form-control" data-name="Enrolled With" name="states[]" multiple="multiple">
                                                        <option value="1">ERS</option>
                                                        <option value="2">Another Agency</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Enrollment Date:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="date" id="enroll-date" class="form-control" data-name="Enrolled With"/>
                                                    </div>
                                                </div>
                                                <label id="error-enroll-date" style="display: none" class="text-danger"></label>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Route / Trading Area:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <select id="route" class="form-control">
                                                            <option value="">--SELECT ROUTE--</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Type of Gear:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <select id="gear_type" class="form-control">
                                                            <option value="">--SELECT GEAR--</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="text-primary">Contract of CoB:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="contract" class="form-control" placeholder="Month"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="text-primary">Manager:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="manager" class="form-control" placeholder="Manager"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Contact Person:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="person" class="form-control" placeholder="Contact Person"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Contact Person's Number:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="person-number" class="form-control" placeholder="Contact Person"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="text-primary">Vessel Union:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <select id="union" class="form-control" data-name="Union">
                                                            <option value="">--SELECT UNION--</option>
                                                        </select>
                                                    </div>
                                                    <label id="error-union" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="text-primary">Effective Date:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="date" id="effective" class="form-control" data-name="Effective Date"/>
                                                    </div>
                                                    <label id="error-effective" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="text-primary">Expiry Date:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="date" id="expiry" class="form-control" data-name="Expiry Date"/>
                                                    </div>
                                                    <label id="error-expiry" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="pull-right">
                                                    <button id="save-changes" class="btn btn-primary">Save Changes
                                                        <i class="fa fa-spinner fa-spin hidden"></i>
                                                    </button>
                                                </div>
                                            </div>

                                        </section>
    
                                        <section id="content1">
                                            <div class="col-sm-12">
                                                <h3 class="animated slideInRight">Technical Specification 
                                                    <i class="fa fa-edit" style="color: blue;" id="edit-specs">
                                                        <span class="tooltiptext" style="font-size: 15px !important;">Click to modify details</span>
                                                    </i>
                                                </h3>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Flags:</label><br />
                                                    <select id="flags" class="form-control" data-name="Flags" name="states[]" multiple="multiple">
                                                    </select>
                                                    <label id="error-flag" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Ex Flag:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="ex-flag" class="form-control" placeholder="Ex Flag"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Port of Registry:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="port" class="form-control" data-name="Port of Registry"/>
                                                    </div>
                                                    <label id="error-port" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Year Built:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="date" id="built" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Owned By:</label><br />
                                                    <select id="owned" class="form-control" data-name="Enrolled With" name="states[]" multiple="multiple">
                                                        <option value="1">Principal</option>
                                                        <option value="2">Others</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Owner Name:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="owner" placeholder="Owner name" class="form-control" data-name="Owner Name"/>
                                                    </div>
                                                    <label id="error-owner" style="display: none" class="text-danger"></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Ex Name:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" placeholder="Ex name" id="ex-owner-name" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Official Number:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="official" class="form-control" placeholder="Official Number"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">IMO Number:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="imo" class="form-control" placeholder="IMO Number"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Main Engine:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="main-engine" class="form-control" placeholder="Main Engine"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Capacity:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="number" min="0" value="0" id="capacity" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Propulsion Power:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="power" class="form-control" placeholder="Propulsion Power"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">GTR:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="gtr" class="form-control" placeholder="GTR"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">DWT:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="dwt" class="form-control" placeholder="DWT"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">Output Power:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="out" class="form-control" placeholder="Output Power"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-primary">NRT:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="nrt" class="form-control" placeholder="NRT"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="text-primary">Classification of Society:</label><br />
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                                        <input type="text" id="classification" class="form-control" placeholder="Classification of Society"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="text-primary">Particulars:</label><br />
                                                    <textarea id="particulars" class="form-control" placeholder="Insert Text"></textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="pull-right">
                                                    <button id="save-changes-specs" class="btn btn-primary">Save Changes
                                                        <i class="fa fa-spinner fa-spin hidden"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </section>
    
                                            <%--start qualification section--%>

                                        <section id="content2">
                                            <div class="col-sm-12">
                                                <h3 class="animated slideInRight">Ranks</h3>

                                            </div>

                                             <div class="col-md-4">
                                                <label>Salary Scale</label>
                                                <select class="form-control" id="scales">
                                                </select>
                                            </div>

                                            <div class="col-md-12">
                                                <button class="btn btn-primary" data-toggle="modal"
                                                    id="add-item" data-target="#addModal">Add New Rank</button>
                                            </div>

                                            <div class="col-md-11">
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
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="rank-tbody">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                        </section>
                                            <%--end qualification section--%>

                                        <section id="content3">
                                            <div class="col-sm-12">
                                                <h3 class="animated slideInRight">Docs and Certificates</h3>
                                            </div>
                                            <div class="col-sm-12">

                                                <button data-toggle="modal" id="toggle-document"
                                                        data-target="#add-document-modal" class="btn btn-primary">
                                                    Add New Item
                                                    <span class="tooltiptext">Click to add new item</span>
                                                </button><br /><br />

                                                <div class="panel panel-danger hidden"> 
                                                    <div class="panel-heading" style="font-size: x-large;"> 
                                                        <i class="fa fa-bookmark-o"></i> Required Documents
                                                    </div> 
                                                    <div class="panel-body">
                                                        <ol class="list-group" id="required">
                                                          
                                                        </ol>
                                                    </div> 
                                                </div>

                                                <div class="panel panel-primary"> 
                                                    <div class="panel-heading" style="font-size: x-large;"> 
                                                        <i class="fa fa-bookmark-o"></i> Documents
                                                    </div> 
                                                    <div class="panel-body">
                                                        <ol class="list-group" id="documents">
                                                          
                                                        </ol>
                                                    </div> 
                                                </div>

                                                <div class="panel panel-primary"> 
                                                    <div class="panel-heading" style="font-size: x-large;"> 
                                                        <i class="fa fa-bookmark-o"></i> Training and Seminars
                                                    </div> 
                                                    <div class="panel-body">
                                                        <ol class="list-group" id="trainings">
                                                          
                                                        </ol>
                                                    </div> 
                                                </div>

                                                <div class="panel panel-primary"> 
                                                    <div class="panel-heading" style="font-size: x-large;"> 
                                                        <i class="fa fa-bookmark-o"></i> Medical and Vaccinations
                                                    </div> 
                                                    <div class="panel-body">
                                                        <ol class="list-group" id="medicals">
                                                          
                                                        </ol>
                                                    </div> 
                                                </div>
                                            </div>

                                        </section>

                                        <section id="content4">
                                            <div class="col-sm-12">
                                                <h3 class="animated slideInRight">Document Library</h3>
                                            </div>
                                            <div class="col-sm-12">

                                                <button data-toggle="modal" id="toggle-document-modal"
                                                        data-target="#add-documentlib-modal" class="btn btn-primary">
                                                    Add New Item
                                                    <span class="tooltiptext">Click to add new item</span>
                                                </button>

                                                <div class="table-responsive">
                                                    <table id="table-docs">
                                                        <thead>
                                                            <tr>
                                                                <td>ID</td>
                                                                <td>Document</td>
                                                                <td>Description</td>
                                                                <td>File</td>
                                                                <td>Remarks</td>
                                                                <td>Added By</td>
                                                                <td>Date Created</td>
                                                                <td>Action</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbody-docs">

                                                        </tbody>
                                                    </table>
                                                </div>
                                                
                                            </div>

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

    <div class="modal fade" id="add-documentlib-modal" role="dialog">
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

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Document Name:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="text" id="document" class="form-control" placeholder="Document Name" data-name="Document"/>
                                </div>
                                <label id="error-document" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Description:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <input type="text" id="description" class="form-control" placeholder="Description"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Upload Document:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <asp:FileUpload runat="server" id="docs" class="form-control" data-name="Document"/>
                                </div>
                                <label id="error-docs" style="display: none" class="text-danger"></label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="text-primary">Remarks:</label><br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                    <textarea id="remarks" class="form-control" placeholder="Remarks"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer"><br />
                    <asp:Button runat="server" ID="saveDocs" CssClass="hide" Text="Upload" OnClick="saveDocs_Click"/>
                    <button id="save-docs" class="btn btn-primary">Upload
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>

                </div>
            </div>
        </div>
    </div>
</form>
<div class="modal fade in" id="edit-item-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Rank</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="col-md-7">
                        <label class="text-primary">Rank:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <select id="rank-edit" class="form-control" data-name="Item">
                                <option value="">--SELECT RANK--</option>
                            </select>
                        </div>
                        <label id="error-rank-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-5">
                        <label class="text-primary">Currency:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <select id="currency-edit" class="form-control" data-name="Currency">
                                <option value="">--SELECT CURRENCY--</option>
                                <option value="1">Peso</option>
                                <option value="2">Dollar</option>
                            </select>
                        </div>
                        <label id="error-currency-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6">
                        <label class="text-primary">Basic Salary (Actual):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="bs-actual-edit" min="0" class="form-control" data-name="Salary"/>
                        </div>
                        <label id="error-bs-actual-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6 hidden">
                        <label class="text-primary">Basic Salary (POEA):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="bs-poea-edit" min="0" class="form-control" data-name="Salary"/>
                        </div>
                        <label id="error-bs-poea-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6">
                        <label class="text-primary">Overtime (Actual):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="ot-actual-edit" min="0" class="form-control" data-name="Overtime"/>
                        </div>
                        <label id="error-ot-actual-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6 hidden">
                        <label class="text-primary">Overtime (POEA):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="ot-poea-edit" min="0" class="form-control" data-name="Overtime"/>
                        </div>
                        <label id="error-ot-poea-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6 hidden">
                        <label class="text-primary">Bonus (Actual):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="bonus-actual-edit" min="0" class="form-control" data-name="Bonus"/>
                        </div>
                        <label id="error-bonus-actual-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6 hidden">
                        <label class="text-primary">Bonus (POEA):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="bonus-poea-edit" min="0" class="form-control" data-name="Bonus"/>
                        </div>
                        <label id="error-bonus-poea-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-12 hidden">
                        <label class="text-primary">Vacation Leave per Month:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="vacation-edit" min="0" class="form-control"/>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="save-changes-rank" class="btn btn-primary">Save Changes
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade in" id="new-edit-item-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Rank</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="col-md-7">
                        <label class="text-primary">Rank:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <select id="new-rank-edit" class="form-control" data-name="Item">
                                <option value="">--SELECT RANK--</option>
                            </select>
                        </div>
                        <label id="error-new-rank-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-5">
                        <label class="text-primary">Currency:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <select id="new-currency-edit" class="form-control" data-name="Currency">
                                <option value="">--SELECT CURRENCY--</option>
                                <option value="1">Peso</option>
                                <option value="2">Dollar</option>
                            </select>
                        </div>
                        <label id="error-new-currency-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6">
                        <label class="text-primary">Basic Salary (Actual):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="new-bs-actual-edit" min="0" class="form-control" data-name="Salary"/>
                        </div>
                        <label id="error-new-bs-actual-edit" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6">
                        <label class="text-primary">Overtime (Actual):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="new-ot-actual-edit" min="0" class="form-control" data-name="Overtime"/>
                        </div>
                        <label id="error-new-ot-actual-edit" style="display: none" class="text-danger"></label>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="new-save-changes-rank" class="btn btn-primary">Save Changes
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade in" id="add-item-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Rank</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="col-md-7">
                        <label class="text-primary">Rank:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <select id="rank" class="form-control" data-name="Item">
                                <option value="">--SELECT RANK--</option>
                            </select>
                        </div>
                        <label id="error-rank" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-5">
                        <label class="text-primary">Currency:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <select id="currency" class="form-control" data-name="Currency">
                                <option value="">--SELECT CURRENCY--</option>
                                <option value="1">Peso</option>
                                <option value="2">Dollar</option>
                            </select>
                        </div>
                        <label id="error-currency" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6">
                        <label class="text-primary">Basic Daily Salary (Actual):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="bs-actual" min="0" class="form-control" data-name="Salary"/>
                        </div>
                        <label id="error-bs-actual" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6 hidden">
                        <label class="text-primary">Basic Salary (POEA):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="bs-poea" value="0" class="form-control" data-name="Salary"/>
                        </div>
                        <label id="error-bs-poea" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6">
                        <label class="text-primary">Fixed Daily Overtime (Actual):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="ot-actual" value="0" class="form-control" data-name="Overtime"/>
                        </div>
                        <label id="error-ot-actual" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6 hidden">
                        <label class="text-primary">Overtime (POEA):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="ot-poea" value="0" class="form-control" data-name="Overtime"/>
                        </div>
                        <label id="error-ot-poea" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6 hidden">
                        <label class="text-primary">Bonus (Actual):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="bonus-actual" value="0" class="form-control" data-name="Bonus"/>
                        </div>
                        <label id="error-bonus-actual" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-6 hidden">
                        <label class="text-primary">Bonus (POEA):</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="bonus-poea" value="0" class="form-control" data-name="Bonus"/>
                        </div>
                        <label id="error-bonus-poea" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-12 hidden">
                        <label class="text-primary">Vacation Leave per Month:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <input type="number" id="vacation" min="0" class="form-control"/>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="save-rank" class="btn btn-primary">Save Rank
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade in" id="add-document-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Document Or Certificate</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="col-md-12">
                        <label class="text-primary">Document or Certificate Type:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <select id="doc-type" class="form-control" data-name="Type">
                                <option value="">--SELECT TYPE--</option>
                                <option value="1">Documents</option>
                                <option value="2">Training and Courses Certificates</option>
                                <option value="3">Vaccination and Medical Certificates</option>
                            </select>
                        </div>
                        <label id="error-doc" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-12">
                        <label class="text-primary">Rank:</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                            <select id="doc-rank" class="form-control" data-name="Item">
                                <option value="">--SELECT RANK--</option>
                            </select>
                        </div>
                        <label id="error-doc-rank" style="display: none" class="text-danger"></label>
                    </div>

                    <div class="col-md-12">
                        <label class="text-primary">Documents or Cetificate Item/s:</label>
                        <select id="items" class="form-control" data-name="Item/s" name="states[]" multiple="multiple">
                        </select>
                        <label id="error-items" style="display: none" class="text-danger"></label>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <br /><br />
                    <button id="save-document" class="btn btn-primary">Save
                        <i class="fa fa-spinner fa-spin hidden"></i>
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addModal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Add New Salary</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Rank:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="position" class="form-control" data-name="Position">
                                    <option value="">--SELECT RANK--</option>
                                </select>
                            </div>
                            <label id="error-position" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Income Description:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="income" placeholder="Income Description" type="text" class="form-control" data-name="Income"/>
                            </div>
                            <label id="error-income" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Remarks:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="remark" placeholder="remarks" type="text" class="form-control" data-name="Remarks"/>
                            </div>
                            <label id="error-remarks" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Monthly (USD):</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="monthly" type="number" min="0" class="form-control" data-name="Monthly"/>
                            </div>
                            <label id="error-monthly" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Daily (USD):</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="daily" type="number" min="0" class="form-control" data-name="Daily"/>
                            </div>
                            <label id="error-daily" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Percentage:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="percentage" type="number" min="0" class="form-control" value="0"/>
                            </div>
                            <label id="error-percentage" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="text-primary">Days:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="days" type="number" min="0" class="form-control" value="0"/>
                            </div>
                            <label id="error-days" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Add to Total:</label><br />
                            <div class="input-group">
                                <input id="total" type="checkbox"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Payout:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="payout" class="form-control">
                                    <option value="1">Rejoining</option>
                                    <option value="2">End of Contract</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button id="save" class="btn btn-primary">Save Salary Scale
                    </button>
                    <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-primary">
                    <span class="fa fa-plus-circle"></span> &nbsp;
                    Modify Salary Scale</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                        
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Rank:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="position-edit" class="form-control" data-name="Position">
                                    <option value="">--SELECT RANK--</option>
                                </select>
                            </div>
                            <label id="error-position-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Income Description:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="income-edit" placeholder="Income Description" type="text" class="form-control" data-name="Income"/>
                            </div>
                            <label id="error-income-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Remarks:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="remarks-edit" placeholder="remarks" type="text" class="form-control" data-name="Remarks"/>
                            </div>
                            <label id="error-remarks-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Monthly (USD):</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="monthly-edit" type="number" min="0" class="form-control" data-name="Monthly"/>
                            </div>
                            <label id="error-monthly-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Daily (USD):</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="daily-edit" type="number" min="0" class="form-control" data-name="Daily"/>
                            </div>
                            <label id="error-daily-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Percentage:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="percentage-edit" type="number" min="0" class="form-control" value="0"/>
                            </div>
                            <label id="error-percentage-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="text-primary">Days:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <input id="days-edit" type="number" min="0" class="form-control" value="0"/>
                            </div>
                            <label id="error-days-edit" style="display: none" class="text-danger"></label>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="text-primary">Add to Total:</label><br />
                            <div class="input-group">
                                <input id="total-edit" type="checkbox"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="text-primary">Payout:</label><br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-info text-primary"></i></span>
                                <select id="payout-edit" class="form-control">
                                    <option value="1">Rejoining</option>
                                    <option value="2">End of Contract</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="saveChanges" class="btn btn-primary">Save Changes
                </button>
                <button data-dismiss="modal" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </div>
</div>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="scripts/WebForms/vesseldetail.js"></script>
</asp:Content>
