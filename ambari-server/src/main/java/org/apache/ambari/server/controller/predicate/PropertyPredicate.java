/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.ambari.server.controller.predicate;

import org.apache.ambari.server.controller.spi.PropertyId;

import java.util.Collections;
import java.util.Set;

/**
 * Predicate that is associated with a resource property.
 */
public abstract class PropertyPredicate implements BasePredicate {
  private final PropertyId propertyId;

  public PropertyPredicate(PropertyId propertyId) {
    this.propertyId = propertyId;
  }

  @Override
  public Set<PropertyId> getPropertyIds() {
    return Collections.singleton(propertyId);
  }

  public PropertyId getPropertyId() {
    return propertyId;
  }

  @Override
  public boolean equals(Object o) {

    if (this == o) {
      return true;
    }

    if (!(o instanceof PropertyPredicate)) {
      return false;
    }

    PropertyPredicate that = (PropertyPredicate) o;

    return propertyId == null ? that.propertyId == null : propertyId.equals(that.propertyId);
  }

  @Override
  public int hashCode() {
    return propertyId != null ? propertyId.hashCode() : 0;
  }
}
