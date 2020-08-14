# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

dev_bu1_project_base = attribute('dev_bu1_project_base')
dev_bu1_project_floating = attribute('dev_bu1_project_floating')
dev_bu1_project_restricted_id = attribute('dev_bu1_project_restricted')
dev_bu1_project_restricted_number = attribute('dev_bu1_project_restricted_number')
dev_bu1_restricted_vpc_service_control_attach_enabled = attribute('dev_bu1_restricted_vpc_service_control_attach_enabled')
dev_bu1_restricted_vpc_service_control_perimeter_name = attribute('dev_bu1_restricted_vpc_service_control_perimeter_name')
dev_bu1_restricted_vpc_service_control_perimeter_services = attribute('dev_bu1_restricted_vpc_service_control_perimeter_services')
access_context_manager_policy_id = attribute('access_context_manager_policy_id')

dev_bu2_project_base = attribute('dev_bu2_project_base')
dev_bu2_project_floating = attribute('dev_bu2_project_floating')
dev_bu2_project_restricted = attribute('dev_bu2_project_restricted')

control 'gcp-development' do
  title 'gcp step 4-projects test development'

  describe google_project(project: dev_bu1_project_floating) do
    it { should exist }
    its('lifecycle_state') { should cmp 'ACTIVE' }
  end

  describe google_project(project: dev_bu1_project_restricted_id) do
    it { should exist }
    its('lifecycle_state') { should cmp 'ACTIVE' }
  end

  describe google_project(project: dev_bu1_project_base) do
    it { should exist }
    its('lifecycle_state') { should cmp 'ACTIVE' }
  end

  describe google_project(project: dev_bu2_project_floating) do
    it { should exist }
    its('lifecycle_state') { should cmp 'ACTIVE' }
  end

  describe google_project(project: dev_bu2_project_restricted) do
    it { should exist }
    its('lifecycle_state') { should cmp 'ACTIVE' }
  end

  describe google_project(project: dev_bu2_project_base) do
    it { should exist }
    its('lifecycle_state') { should cmp 'ACTIVE' }
  end

end

control 'gcloud-development' do
  title 'gcloud step 4-projects test development'

  describe command("gcloud access-context-manager perimeters describe #{dev_bu1_restricted_vpc_service_control_perimeter_name} --format=json") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq '' }

    let(:data) do
      if subject.exit_status.zero?
        JSON.parse(subject.stdout)
      else
        {}
      end
    end

    describe "Access Context Manager perimeter #{dev_bu1_restricted_vpc_service_control_perimeter_name}" do
      it 'should exist' do
        expect(data).to_not be_empty
      end

      it "should include #{dev_bu1_project_restricted_id} project" do
        expect(data).to include(
          'resources' => ["projects/#{dev_bu1_project_restricted_number}"]
        )
      end

      # it "should have #{dev_bu1_restricted_vpc_service_control_perimeter_services} apis" do
      #   expect(data).to include(
      #     'restrictedServices' => dev_bu1_restricted_vpc_service_control_perimeter_services
      #   )
      # end
    end
  end
end